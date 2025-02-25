import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_detail.g.dart'; // Generated file

@HiveType(typeId: 0)
class ProductDetail extends Equatable {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final double price;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String category;

  ProductDetail({
    required this.title,
    required this.price,
    required this.image,
    required this.category,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      category: json['category'],
    );
  }

  @override
  List<Object> get props => [title, price, image, category];
}