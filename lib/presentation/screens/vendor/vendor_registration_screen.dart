import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/screens/landing_screen.dart';
import 'package:konbini/presentation/screens/vendor/components/custom_text_field.dart';
import 'package:konbini/presentation/widgets/custom_appbar.dart';
import 'package:konbini/services/firebase_service.dart';

class VendorRegistrationScreen extends StatefulWidget {
  const VendorRegistrationScreen({super.key});

  static const String routeName = '/vendorRegistration';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const VendorRegistrationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<VendorRegistrationScreen> createState() =>
      _VendorRegistrationScreenState();
}

class _VendorRegistrationScreenState extends State<VendorRegistrationScreen> {
  final FirebaseService _service = FirebaseService();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _vendorNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _municipalityController = TextEditingController();
  final TextEditingController _wardNoController = TextEditingController();
  final TextEditingController _panNumberController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? storeImage;
  XFile? businessLogo;
  String? storeImageName;
  String? businessLogoName;

  //vendor

  //function to pick image from gallery
  Future pickImage() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  //vendor
  vendorSignUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } catch (e) {
      print("Error during sign-up: $e");
    }
  }

  //saving image to firestorage
  saveToDB() async {
    EasyLoading.show();
    //first save image
    String storeImageFilePath = 'storeImage/$storeImageName';
    String businessLogoFilePath = 'businesslogo/$businessLogoName';
    final storeImagestorageRef = FirebaseStorage.instance
        .ref("vendorImage/${_service.currentUser!.uid}/$storeImageFilePath");
    final businessLogostorageRef = FirebaseStorage.instance
        .ref("vendorImage/${_service.currentUser!.uid}/$businessLogoFilePath");
    // print("image saved in storage");
    //get image downloadURL
    try {
      await storeImagestorageRef.putFile(File(storeImage!.path));
      String storeImageDownloadUrl =
          await storeImagestorageRef.getDownloadURL();
      await businessLogostorageRef.putFile(File(businessLogo!.path));
      String businessLogoDownloadUrl =
          await businessLogostorageRef.getDownloadURL();
      // print("got downloadURL");

      //save data to firestore
      _service.addVendor({
        'approved': false,
        'uid': _service.currentUser!.uid,
        'businessName': _vendorNameController.text,
        'businessEmail': _emailController.text,
        'contactNumber': "+977${_contactNumberController.text}",
        'city': _cityController.text,
        'province': _provinceController.text,
        'municipality': _municipalityController.text,
        'wardNumber': _wardNoController.text,
        'address': _addressController.text,
        'PANnumber': _panNumberController.text,
        'storeImage': storeImageDownloadUrl,
        'businessLogo': businessLogoDownloadUrl,
        'time': DateTime.now(),
        'role': 'Vendor'
      }).then((value) {
        // print("vendor added");
        // clear();
        EasyLoading.dismiss();
        Navigator.pushReplacementNamed(context, LandingScreen.routeName);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: primaryColor,
            content: const Text(
                'Registration sent successfully, please wait for approval'),
            duration: const Duration(seconds: 3),
          ),
        );
      });
    } on FirebaseException catch (e) {
      // clear();
      print(e.toString());
    }
  }

  clear() {
    setState(() {
      _vendorNameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _contactNumberController.clear();
      _cityController.clear();
      _provinceController.clear();
      _municipalityController.clear();
      _wardNoController.clear();
      _addressController.clear();
      _panNumberController.clear();
      storeImage = null;
      businessLogo = null;
    });
  }

  _snackbarMessage(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppbar(title: "Vendor Registration"),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        pickImage().then((value) {
                          setState(() {
                            storeImage = value;
                            storeImageName = storeImage!.name;
                          });
                        });
                      },
                      child: Container(
                        color: secondaryColor4,
                        height: 250,
                        child: storeImage == null
                            ? const Center(
                                child: Text(
                                  "Click to Add Store Image",
                                  style: TextStyle(color: Colors.white54),
                                ),
                              )
                            : Image.file(
                                File(storeImage!.path),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              color: secondaryColor3,
                              height: 80,
                              width: 80,
                              child: businessLogo == null
                                  ? const Center(
                                      child: Text(
                                        "LOGO",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    )
                                  : Image.file(
                                      File(businessLogo!.path),
                                      fit: BoxFit.contain,
                                    ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              pickImage().then((value) {
                                setState(() {
                                  businessLogo = value;
                                  businessLogoName = businessLogo!.name;
                                });
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: baseColor,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text("Upload logo"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        labelText: 'Business Name',
                        controller: _vendorNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter business name";
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        labelText: 'Business email',
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter business email";
                          } else if (!value.contains("@gmail.com")) {
                            return "Invalid email address";
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        labelText: 'Password',
                        type: TextInputType.text,
                        obscureText:
                            true, // This will hide the entered password characters
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter password";
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        prefixText: "+977 ",
                        labelText: 'Contact Number',
                        type: TextInputType.phone,
                        maxLength: 10,
                        controller: _contactNumberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter contact number";
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 160,
                            child: CustomTextFormField(
                              labelText: 'City',
                              type: TextInputType.text,
                              controller: _cityController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter city";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              labelText: 'Province',
                              type: TextInputType.text,
                              controller: _provinceController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter province";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              labelText: 'Municipality',
                              type: TextInputType.text,
                              controller: _municipalityController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter municipality";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: CustomTextFormField(
                              labelText: 'Ward No',
                              type: TextInputType.number,
                              controller: _wardNoController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter ward no";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      CustomTextFormField(
                        labelText: 'Address',
                        type: TextInputType.text,
                        controller: _addressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter address";
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        labelText: 'PAN Number',
                        type: TextInputType.text,
                        controller: _panNumberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter PAN number";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        persistentFooterButtons: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: baseColor,
                  ),
                  onPressed: () {
                    if (storeImage == null) {
                      _snackbarMessage("Please select store image");
                      return;
                    }
                    if (businessLogo == null) {
                      _snackbarMessage("Please select store logo");
                      return;
                    }
                    if (_formKey.currentState!.validate()) {
                      vendorSignUp();
                      saveToDB();
                      clear();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("Register"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
