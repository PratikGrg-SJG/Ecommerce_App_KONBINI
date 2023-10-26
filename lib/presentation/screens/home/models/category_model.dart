class CategoriesModel {
  final String name, image;

  CategoriesModel(this.name, this.image);

  // Named constructor to create instances with multiple fields
  CategoriesModel.fromFirestore(Map<String, dynamic> data)
      : name = data['categoryName'],
        image = data['image'];
}
