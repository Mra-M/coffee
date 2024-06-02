import 'dart:convert';

//List<ProductData> productDataFromJson(String str) => List<ProductData>.from(json.decode(str).map((x) => ProductData.fromJson(x)));

class ProductData {
  int id;
  String title;
  String image;
  String subTitle;
  String description;
  int quantity;
  bool isFav;
  String price;

  ProductData({
    required this.id,
    required this.title,
    required this.image,
    required this.subTitle,
    required this.description,
    required this.quantity,
    required this.isFav,
    required this.price,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    subTitle: json["subTitle"],
    description: json["description"],
    quantity: json["quantity"],
    isFav: json["isFav"],
    price: json["price"],
  );

}
