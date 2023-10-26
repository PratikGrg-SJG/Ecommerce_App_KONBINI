class PopularProductModel {
  final int id;
  final String name, category, price, details, imagePath;

  PopularProductModel(
      {required this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.details,
      required this.imagePath});
}

final popularProducts = [
  PopularProductModel(
      id: 1,
      name: "Fresh Ribbed Collar Knit",
      category: "Polos",
      price: "Rs 800",
      details: """Fabric/Material
Acrylic Blend
Care Info
Dry Clean""",
      imagePath: "assets/products/popularproducts/pp1.jpg"),
  PopularProductModel(
      id: 2,
      name: "Basic Half Pants",
      category: "Shorts",
      price: "Rs 600",
      details: """Fabric/Material
Cotton 83%, Polyester 17%
Care Info
Cold Wash""",
      imagePath: "assets/products/popularproducts/pp2.jpg"),
  PopularProductModel(
      id: 3,
      name: "World Comfort Semi Boot Cut Jeans",
      category: "Jeans",
      price: "Rs 1700",
      details: """Fabric/Material
Cotton 97%, Polyurethane 3%
Care Info
Dry Clean, Hand Wash""",
      imagePath: "assets/products/popularproducts/pp3.jpg"),
  PopularProductModel(
      id: 4,
      name: "Tire Span Long Wide Jeans",
      category: "Jeans",
      price: "Rs 2000",
      details: """Fabric/Material
Cotton 100%
Care Info
Cold Wash""",
      imagePath: "assets/products/popularproducts/pp4.jpg"),
  PopularProductModel(
      id: 5,
      name: "Unisex Authentic Logo Hoodie Oatmeal",
      category: "Hoodies",
      price: "Rs 1400",
      details: """Fabric/Material
Cotton 100%
Care Info
Dry Clean, Hand Wash""",
      imagePath: "assets/products/popularproducts/pp5.jpg"),
  PopularProductModel(
      id: 6,
      name: "Urban 12 Strapback Cap",
      category: "Hats",
      price: "Rs 600",
      details: """Fabric/Material
Cotton""",
      imagePath: "assets/products/popularproducts/pp6.jpg"),
  PopularProductModel(
      id: 7,
      name: "Terry Oversized Open Collar Tee Shirt",
      category: "V-Neck",
      price: "Rs 850",
      details: """Fabric/Material
Cotton 95%, Span 5%
Care Info
Dry Clean, Hand Wash""",
      imagePath: "assets/products/popularproducts/pp7.jpg"),
  PopularProductModel(
      id: 8,
      name: "Cube Summer Plaid Shirt",
      category: "Shirts",
      price: "Rs 900",
      details: """Fabric/Material
Cotton 100%
Care Info
Dry Clean""",
      imagePath: "assets/products/popularproducts/pp9.jpg"),
  PopularProductModel(
      id: 9,
      name: "Loose Weight Youth Skirt Vol 15",
      category: "Skirts",
      price: "Rs 1200",
      details: """Fabric/Material
Polyester 90%, Rayon 6%, Span 4%
Care Info
Dry Clean, Hand Wash""",
      imagePath: "assets/products/popularproducts/pp10.jpg"),
  PopularProductModel(
      id: 10,
      name: "Pro Argyle Cardigan",
      category: "Sweaters",
      price: "Rs 1300",
      details: """Fabric/Material
Acrylic Fiber Blend
Care Info
Dry Clean""",
      imagePath: "assets/products/popularproducts/pp11.jpg"),
  PopularProductModel(
      id: 11,
      name: "Pie Plaid Skirt",
      category: "Skirts",
      price: "Rs 1300",
      details: """Fabric/Material
Polyester 97%, Span 3%
Care Info
Dry Clean, Hand Wash""",
      imagePath: "assets/products/popularproducts/pp12.jpg"),
  PopularProductModel(
      id: 12,
      name: "Carpebeam Baseball Cap",
      category: "Hats",
      price: "Rs 400",
      details: """Fabric/Material
Cotton""",
      imagePath: "assets/products/popularproducts/pp13.jpg"),
  PopularProductModel(
      id: 13,
      name: "Lined Bucket Hat",
      category: "Hats",
      price: "RS 600",
      details: """Fabric/Material
Cotton""",
      imagePath: "assets/products/popularproducts/pp14.jpg"),
];
