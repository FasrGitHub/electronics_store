import 'package:electronics_store/common/app_colors.dart';
import 'package:electronics_store/features/cart/domain/entities/product_basket_entity.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CardProductBasket extends StatelessWidget {
  final ProductBasketEntity productBasket;
  final formatter = NumberFormat('000.00');

  CardProductBasket({Key? key, required this.productBasket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ExtendedImage.network(
          productBasket.images,
          height: 88,
          width: 88,
          fit: BoxFit.fitWidth,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),

        Expanded(
          flex: 12,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productBasket.title,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '\$${formatter.format(productBasket.price)}',
                  style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.orange,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),

        Spacer(),

        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF282843),
            borderRadius: BorderRadius.circular(26),
          ),
          child: SizedBox(
            width: 26,
            height: 68,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.minimize, size: 16, color: Colors.white,),
                Spacer(),
                Text("2", style: TextStyle(fontSize: 20, color: Colors.white,),),
                Spacer(),
                Icon(Icons.add, size: 16, color: Colors.white,),
                Spacer(),
              ],
            ),
          ),
        ),
        Spacer(),

        InkWell(
          onTap: () {},
          child: SvgPicture.asset('assets/icons/icon_recycle_bin.svg'),
        ),
      ],
    );
  }
}
