import 'package:electronics_store/features/details/domain/entities/product_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  const ProductDetailsModel(
      {required super.id,
      required super.title,
      required super.cpu,
      required super.camera,
      required super.sd,
      required super.ssd,
      required super.price,
      required super.rating,
      required super.isFavorite,
      required super.capacity,
      required super.color,
      required super.images});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
        id: json['id'] as String,
        title: json['title'] as String,
        cpu: json['CPU'] as String,
        camera: json['camera'] as String,
        sd: json['sd'] as String,
        ssd: json['ssd'] as String,
        price: json['price'] as int,
        rating: json['rating'] as double,
        isFavorite: json['isFavorites'] as bool,
        capacity: (json['capacity'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        color:
            (json['color'] as List<dynamic>).map((e) => e as String).toList(),
        images:
            (json['images'] as List<dynamic>).map((e) => e as String).toList());
  }
}
