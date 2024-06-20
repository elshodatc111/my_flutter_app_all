import 'package:me_youtube_aplication/screen/provider_two/data/model/product_model/rating_model.dart';

class ProductModel {
  int id;
  String title;
  num price;
  String description;
  String catigory;
  String image;
  RatingModel raiting;

  ProductModel({
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.catigory,
    required this.id,
    required this.raiting,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'] ?? "",
      image: json['image'] ?? "",
      description: json['description'] ?? "",
      price: json['price'] ?? 0,
      catigory: json['catigory'] ?? "",
      id: json['id'] ?? 0,
      raiting: RatingModel.fromJson(json["raiting"]?? {}),
    );
  }
}
