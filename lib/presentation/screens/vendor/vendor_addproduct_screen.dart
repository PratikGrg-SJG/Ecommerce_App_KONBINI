import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/screens/vendor/components/custom_text_field.dart';
import 'package:konbini/presentation/widgets/custom_appbar.dart';

class VendorAddProductScreen extends StatefulWidget {
  const VendorAddProductScreen({super.key});

  static const String routeName = "/vendorAddProduct";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const VendorAddProductScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<VendorAddProductScreen> createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorAddProductScreen> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDetailsController =
      TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productCategoryController =
      TextEditingController();
  final TextEditingController _productDiscountController =
      TextEditingController();
  final TextEditingController _productOfferPriceController =
      TextEditingController();
  double _popularity = 3.0;
  final ImagePicker _picker = ImagePicker();

  XFile? file;

  //function to pick image from gallery
  Future pickImage() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      file = selectedImage;
    });
  }

  //function to update popularity value
  updatePopularity(double value) {
    setState(() {
      _popularity = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppbar(title: 'Add Product (Vendor)'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                    onTap: () async {
                      // file = await ImagePicker()
                      //     .pickImage(source: ImageSource.gallery);
                      pickImage();
                    },
                    child: file == null
                        ? Stack(
                            children: [
                              SizedBox(
                                // color: Colors.grey,
                                height: 200,
                                width: double.infinity,
                                child: Image.asset(
                                  'assets/images/noImage.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Positioned(
                                bottom: 30,
                                right: 60,
                                child: Icon(
                                  Icons.add_photo_alternate_rounded,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              )
                            ],
                          )
                        : SizedBox(
                            // color: Colors.grey,
                            height: 200,
                            width: double.infinity,
                            child: Image.file(
                              File(file!.path),
                              fit: BoxFit.contain,
                            ),
                          )),
                CustomTextFormField(
                 
                    hintText: "Product Name",
                    controller: _productNameController),
                CustomTextFormField(
                  
                  hintText: "Product Details",
                  controller: _productDetailsController,
                ),
                CustomTextFormField(
                  
                  hintText: "Price",
                  controller: _productPriceController,
                ),
                CustomTextFormField(
                  hintText: "Category",
                  controller: _productCategoryController,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        hintText: "Discount (%)",
                        controller: _productDiscountController,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        hintText: "Offer Price",
                        controller: _productOfferPriceController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Popularity',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Slider(
                  activeColor: baseColor,
                  value: _popularity,
                  min: 1,
                  max: 5,
                  divisions: 4,
                  onChanged: (value) {
                    updatePopularity(value);
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: baseColor,
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("Add Product"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
