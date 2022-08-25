import 'package:electronics_store/features/splash/domain/entities/banner_product_entity.dart';

class BannerProductModel extends BannerProductEntity {
  const BannerProductModel({
    required id,
    required isNew,
    required title,
    required subtitle,
    required picture,
    required isBuy,
  }) : super(
          id: id,
          isNew: isNew,
          title: title,
          subtitle: subtitle,
          picture: picture,
          isBuy: isBuy,
        );

  factory BannerProductModel.fromJson(Map<String, dynamic> json) {
    return BannerProductModel(
      id: json['id'] as int,
      //Todo не очень решение
      isNew: json['is_new'] != null ? true : false,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      picture: json['picture'] as String,
      isBuy: json['is_buy'] as bool,
    );
  }
}
