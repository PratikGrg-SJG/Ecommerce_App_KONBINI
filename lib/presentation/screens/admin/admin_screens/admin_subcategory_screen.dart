import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/screens/admin/components/subcategory_list.dart';
import 'package:konbini/services/firebase_service.dart';

class AdminSubCategoryScreen extends StatefulWidget {
  const AdminSubCategoryScreen({super.key});

  static const String routeName = "/adminSubCategory";

  @override
  State<AdminSubCategoryScreen> createState() => _AdminSubCategoryScreenState();
}

class _AdminSubCategoryScreenState extends State<AdminSubCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _subCategoryNameController =
      TextEditingController();
  final FirebaseService _service = FirebaseService();
  Object? _selectedValue;
  bool _noCategorySelected = false;
  QuerySnapshot? snapshot;

  clear() {
    setState(() {
      _selectedValue = null;
      _subCategoryNameController.clear();
    });
  }

  Widget _dropDownButton() {
    return DropdownButton(
      value: _selectedValue,
      hint: const Text("Select Category"),
      items: snapshot!.docs.map((e) {
        return DropdownMenuItem<String>(
          value: e['categoryName'],
          child: Text(e['categoryName']),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedValue = value;
          _noCategorySelected = false;
        });
      },
    );
  }

  getCategoryList() {
    _service.category.get().then((QuerySnapshot querySnapshot) {
      setState(() {
        snapshot = querySnapshot;
      });
    });
  }

  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sub Categories",
              style: TextStyle(fontSize: 23),
            ),
            const Divider(thickness: 2),
            const SizedBox(
              height: 15,
            ),
            const Text("Add New Sub Category"),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 160, // Set the height to match the container's height
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      snapshot == null
                          ? const Text("Loading")
                          : _dropDownButton(),
                      //
                      if (_noCategorySelected == true)
                        const Text(
                          "Please select category",
                          style: TextStyle(
                              fontSize: 15,
                              // fontWeight: FontWeight.normal,
                              color: Colors.red),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter sub-category name";
                          } else {
                            return null;
                          }
                        },
                        controller: _subCategoryNameController,
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: "Sub-Category Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {},
                              child: const Text("Cancel"),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: primaryColor,
                              ),
                              onPressed: () {
                                if (_selectedValue == null) {
                                  setState(() {
                                    _noCategorySelected = true;
                                  });
                                  return;
                                }
                                if (_formKey.currentState!.validate()) {
                                  EasyLoading.show();
                                  _service.saveSubCategory({
                                    'categoryName': _selectedValue,
                                    'subCategoryName':
                                        _subCategoryNameController.text,
                                  }).then((value) {
                                    clear();
                                    EasyLoading.dismiss();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text(
                                            "Sub-Category added successfully!"),
                                        backgroundColor: primaryColor,
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  });
                                }
                              },
                              child: const Text("Save"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("Sub-Category List"),
            const Expanded(child: AdminSubCategoryList())
          ],
        ),
      ),
    );
  }
}
