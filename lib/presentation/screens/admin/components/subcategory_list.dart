// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/services/firebase_service.dart';

class AdminSubCategoryList extends StatefulWidget {
  const AdminSubCategoryList({super.key});

  @override
  State<AdminSubCategoryList> createState() => _AdminCategoryListState();
}

class _AdminCategoryListState extends State<AdminSubCategoryList> {
  final FirebaseService _service = FirebaseService();

  Object? _selectedValue;
  QuerySnapshot? snapshot;
  bool _noCategorySelected = true;

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

  void deleteSubCategory(String subCategoryId) {
    // Show a confirmation dialog to confirm the deletion.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          title: const Text("Confirm Delete"),
          content:
              const Text("Are you sure you want to delete this sub-category?"),
          actions: [
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: baseColor),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              onPressed: () {
                _service.deleteSubCategory(subCategoryId);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Category successfully deleted !'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseService service = FirebaseService();
    return snapshot == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Row(
                children: [
                  _dropDownButton(),
                  const Icon(Icons.filter_list),
                ],
              ),
              StreamBuilder<QuerySnapshot>(
                stream: service.subCategory
                    .where('categoryName', isEqualTo: _selectedValue)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: LinearProgressIndicator());
                  }
                  if (snapshot.data!.size == 0) {
                    return const Expanded(
                      child: Center(
                          child:
                              SizedBox(child: Text("No Sub-Categories Found"))),
                    );
                  }
                  return Expanded(
                    child: ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return ListTile(
                          title: Text(data['subCategoryName']),
                          trailing: PopupMenuButton<String>(
                            icon: const Icon(Icons.more_vert),
                            onSelected: (value) {
                              if (value == 'edit') {
                              } else if (value == 'delete') {
                                String subCategoryId = document.id;
                                deleteSubCategory(subCategoryId);
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                const PopupMenuItem<String>(
                                  value: 'edit',
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit, color: Colors.black),
                                      SizedBox(width: 8),
                                      Text('Edit'),
                                    ],
                                  ),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'delete',
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete, color: Colors.red),
                                      SizedBox(width: 8),
                                      Text('Delete',
                                          style: TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                ),
                              ];
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ],
          );
  }
}
