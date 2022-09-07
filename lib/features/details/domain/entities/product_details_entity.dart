import 'package:equatable/equatable.dart';

class ProductDetailsEntity extends Equatable {

  final String id;
  final String title;
  final String cpu;
  final String camera;
  final String sd;
  final String ssd;
  final int price;
  final double rating;
  final bool isFavorite;
  final List<String> capacity;
  final List<String> color;
  final List<String> images;

  const ProductDetailsEntity({
    required this.id,
    required this.title,
    required this.cpu,
    required this.camera,
    required this.sd,
    required this.ssd,
    required this.price,
    required this.rating,
    required this.isFavorite,
    required this.capacity,
    required this.color,
    required this.images,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    cpu,
    camera,
    sd,
    ssd,
    price,
    rating,
    isFavorite,
    capacity,
    color,
    images,
  ];
}