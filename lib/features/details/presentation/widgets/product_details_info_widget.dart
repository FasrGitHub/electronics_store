import 'package:electronics_store/common/app_colors.dart';
import 'package:electronics_store/features/details/domain/entities/product_details_entity.dart';
import 'package:electronics_store/features/details/presentation/widgets/tab_bar_product_details.dart';
import 'package:flutter/material.dart';

class ProductDetailsInfoWidget extends StatelessWidget {
  final ProductDetailsEntity productDetails;

  const ProductDetailsInfoWidget({Key? key, required this.productDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 471,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: -5,
                blurRadius: 10,
                offset: const Offset(0, 4))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  productDetails.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const Spacer(
                  flex: 2,
                ),
                Container(
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          Row(
            children: [
              const Spacer(),
              bodyStars(),
              bodyStars(),
              bodyStars(),
              bodyStars(),
              bodyStars(),
              const Spacer(
                flex: 7,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: TabBarProductDetails(productDetails: productDetails,),
            ),
          )
        ],
      ),
    );
  }

  //TODO в этом методе возможно реализовать логику рейтинга товара.
  Widget bodyStars() {
    return const Padding(
      padding: EdgeInsets.only(right: 5.0),
      child: Icon(
        Icons.star,
        color: Color(0xFFFFB800),
        size: 18,
      ),
    );
  }
}
