import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/models/category_model.dart';
import 'package:konbini/services/firebase_service.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    super.key,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final FirebaseService _service = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: _service.fetchCategory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<CategoryModel>? categories = snapshot.data;
          return ListView.builder(
            itemCount: categories?.length ?? 0,
            itemBuilder: (context, index) {
              var category = categories![index];
              return ExpansionTile(
                textColor: baseColor,
                title: Text(category.categoryName),
                leading: CachedNetworkImage(
                  color: baseColor,
                  imageUrl: category.image,
                  height: 25,
                ),
                children: [
                  FutureBuilder<List<SubCategoryModel>>(
                    future: _service.fetchSubCategory(category.categoryName),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<SubCategoryModel>? subcategories = snapshot.data;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: subcategories?.length ?? 0,
                          itemBuilder: (context, index) {
                            var subcategory = subcategories![index];
                            return ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(left: 58),
                                child: Text(subcategory.subCategoryName),
                              ),
                              onTap: () {},
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
