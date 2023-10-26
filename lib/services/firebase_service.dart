import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:konbini/models/category_model.dart';

class FirebaseService {
  CollectionReference user = FirebaseFirestore.instance.collection('user');
  CollectionReference vendor = FirebaseFirestore.instance.collection('vendor');

  CollectionReference homeBanner =
      FirebaseFirestore.instance.collection('homeBanner');

  CollectionReference category =
      FirebaseFirestore.instance.collection('category');

  CollectionReference subCategory =
      FirebaseFirestore.instance.collection('subCategory');
  //for knowing user
  User? currentUser = FirebaseAuth.instance.currentUser;
  

  //for category

  Future<void> saveCategory(Map<String, dynamic> data) {
    return category.doc().set(data);
  }

  Future<List<CategoryModel>> fetchCategory() async {
    QuerySnapshot querySnapshot = await category.get();
    return querySnapshot.docs.map((doc) {
      return CategoryModel(
          categoryName: doc['categoryName'], image: doc['image']);
    }).toList();
  }

  Future<void> updateCategory(String categoryId, Map<String, dynamic> data) {
    return category.doc(categoryId).update(data);
  }

  Future<void> deleteCategory(String categoryId) async {
    try {
      await category.doc(categoryId).delete();
      print("Category deleted successfully.");
    } catch (e) {
      print("Error deleting category: $e");
    }
  }

  //for subcategory
  Future<void> saveSubCategory(Map<String, dynamic>? data) {
    return subCategory.doc().set(data);
  }

  Future<List<SubCategoryModel>> fetchSubCategory(String categoryName) async {
    QuerySnapshot querySnapshot =
        await subCategory.where('categoryName', isEqualTo: categoryName).get();
    return querySnapshot.docs.map((doc) {
      return SubCategoryModel(
          categoryName: doc['categoryName'],
          subCategoryName: doc['subCategoryName']);
    }).toList();
  }

  Future<void> updateSubCategory(
      String subCategoryId, Map<String, dynamic> data) {
    return subCategory.doc(subCategoryId).update(data);
  }

  Future<void> deleteSubCategory(String subCategoryId) async {
    try {
      await subCategory.doc(subCategoryId).delete();
      print("Sub-Category deleted successfully.");
    } catch (e) {
      print("Error deleting sub-category: $e");
    }
  }

  //for vendor
  Future<void> addVendor(Map<String, dynamic> data) {
    return vendor.doc(currentUser!.uid).set(data);
  }
}
