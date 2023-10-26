import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/screens/admin/components/categorylist.dart';
import 'package:konbini/services/firebase_service.dart';

class AdminMainCategoryScreen extends StatefulWidget {
  const AdminMainCategoryScreen({super.key});

  static const String routeName = "/adminMainCategory";

  @override
  State<AdminMainCategoryScreen> createState() =>
      _AdminMainCategoryScreenState();
}

class _AdminMainCategoryScreenState extends State<AdminMainCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseService _service = FirebaseService();

  final TextEditingController _categoryNameController = TextEditingController();

  bool isEditing = false;
  String? imgUrl;

  //for picking image
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String? imageName;

  clear() {
    setState(() {
      _categoryNameController.clear();
      image = null;
    });
  }

  // Method to handle the editing of an existing category
  void editCategory(String categoryName, String imageUrl) {
    setState(() {
      _categoryNameController.text = categoryName;
      imgUrl = imageUrl;
      isEditing = true;
    });
  }

  Future pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = pickedImage;
      imageName = pickedImage!.name;
    });
  }

  //saving image to firestorage
  saveToDB() async {
    EasyLoading.show();
    String filePath = 'categoryImage/$imageName';
    final storageRef = FirebaseStorage.instance.ref(filePath);

    try {
      await storageRef.putFile(File(image!.path));
      String downloadUrl = await storageRef.getDownloadURL();
      //save data to firestore
      _service.saveCategory({
        'categoryName': _categoryNameController.text,
        'image': downloadUrl
      }).then((value) {
        clear();
        EasyLoading.dismiss();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: primaryColor,
            content: const Text('Category successfully added !'),
            duration: const Duration(seconds: 2),
          ),
        );
      });
    } on FirebaseException catch (e) {
      clear();
      print(e.toString());
    }
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
              "Categories",
              style: TextStyle(fontSize: 23),
            ),
            const Divider(thickness: 2),
            const SizedBox(
              height: 15,
            ),
            isEditing
                ? const Text("Edit Category")
                : const Text("Add New Category"),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    isEditing
                        ? Image.network(
                            imgUrl.toString(),
                            height: 100,
                            width: 100,
                          )
                        : image == null
                            ? Container(
                                height: 100,
                                width: 100,
                                color: secondaryColor3,
                                child: Image.asset('assets/images/noImage.png'),
                              )
                            : SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.file(File(image!.path)),
                              ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: baseColor,
                      ),
                      onPressed: () {
                        pickImage();
                      },
                      child: const Text("Upload Image"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100, // Set the height to match the container's height
                  child: VerticalDivider(
                    width: 25,
                    thickness: 2,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _categoryNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter category name';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: "Category Name",
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
                          isEditing
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      clear();
                                      isEditing = false;
                                    });
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: baseColor),
                                  ),
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  onPressed: () {
                                    clear();
                                  },
                                  child: Text(
                                    "Clear",
                                    style: TextStyle(color: baseColor),
                                  ),
                                ),
                          isEditing
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: primaryColor,
                                  ),
                                  onPressed: () {},
                                  child: const Text("Update"),
                                )
                              : image == null
                                  ? Container(
                                      width: 65,
                                    )
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor: primaryColor,
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          saveToDB();
                                        }
                                      },
                                      child: const Text("Save"),
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
            const Text("Category List"),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: AdminCategoryList(editCategory: editCategory),
            ),
          ],
        ),
      ),
    );
  }
}
