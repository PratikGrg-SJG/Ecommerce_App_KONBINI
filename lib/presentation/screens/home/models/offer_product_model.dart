class OfferProductModel {
  final String name, price, offerPercent, offerPrice, category, imagePath;

  OfferProductModel(
      {required this.name,
      required this.price,
      required this.offerPercent,
      required this.offerPrice,
      required this.category,
      required this.imagePath});
}

final offerProducts = [
  OfferProductModel(
      name: "Tarot Napies Heraclio Forurnier Sweatshirt",
      price: "Rs 2200",
      offerPercent: "-20%",
      offerPrice: "Rs 1760",
      category: "Sweatshirt",
      imagePath: "assets/products/op1.jpg"),
  OfferProductModel(
      name: "Cropped Cargo Trousers",
      price: "Rs 2600",
      offerPercent: "-42%",
      offerPrice: "Rs 1508",
      category: "Trousers",
      imagePath: "assets/products/op2.jpg"),
  OfferProductModel(
      name: "Tie-die Print Overshirt",
      price: "Rs 1900",
      offerPercent: "-15%",
      offerPrice: "Rs 1615",
      category: "Shirt",
      imagePath: "assets/products/op3.jpg"),
  OfferProductModel(
      name: "Basic Soft Sweater",
      price: "Rs 2400",
      offerPercent: "-20%",
      offerPrice: "Rs 1920",
      category: "Sweater",
      imagePath: "assets/products/op4.jpg"),
];
