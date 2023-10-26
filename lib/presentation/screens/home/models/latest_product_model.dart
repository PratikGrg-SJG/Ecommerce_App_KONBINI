class LatestProductModel {
  final int id;
  final String imagePath, name, category, price;

  LatestProductModel({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.category,
    required this.price,
  });
}

final products = [
  LatestProductModel(
      id: 1,
      imagePath: "assets/products/product1.jpg",
      name: "Overfit Summer T-Shirt",
      category: "T-Shirt",
      price: "Rs 200"),
  LatestProductModel(
      id: 2,
      imagePath: "assets/products/product2.png",
      name: "Nike Dunk Low",
      category: "Shoes",
      price: "Rs 1000"),
  LatestProductModel(
      id: 3,
      imagePath: "assets/products/product3.png",
      name: "Nike Sportswear",
      category: "T-Shirt",
      price: "Rs 400"),
  LatestProductModel(
      id: 4,
      imagePath: "assets/products/product4.jpg",
      name: "Denim Jacket",
      category: "Jacket",
      price: "Rs 1500"),
];
