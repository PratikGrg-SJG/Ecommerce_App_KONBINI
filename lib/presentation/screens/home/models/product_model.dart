class ProductModel {
  final String id;
  final String imagePath, name, category;
  final double price;
  final bool hasOffer;
  final double discountPercent;
  final double offerPrice;
  final int popularity;

  ProductModel({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.category,
    required this.price,
    this.hasOffer = false,
    this.discountPercent = 0.0,
    this.offerPrice = 0.0,
    this.popularity = 0,
  });

  // Convert ProductModel instance to a map (to store in Firebase)
  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'name': name,
      'category': category,
      'price': price,
      'hasOffer': hasOffer,
      'discountPercent': discountPercent,
      'offerPrice': offerPrice,
      'popularity': popularity,
    };
  }
}
