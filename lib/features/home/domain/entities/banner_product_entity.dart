import 'package:equatable/equatable.dart';

class BannerProductEntity extends Equatable {
  final int id;
  final bool isNew;
  final String title;
  final String subtitle;
  final String picture;
  final bool isBuy;

  const BannerProductEntity({
    required this.id,
    required this.isNew,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });

  @override
  List<Object?> get props => [
        id,
        isNew,
        title,
        subtitle,
        picture,
        isBuy,
      ];
}
