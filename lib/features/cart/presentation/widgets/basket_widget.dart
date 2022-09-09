import 'package:electronics_store/common/app_colors.dart';
import 'package:electronics_store/features/cart/domain/entities/basket_entity.dart';
import 'package:electronics_store/features/cart/presentation/widgets/card_product_basket.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BasketWidget extends StatelessWidget {
  final BasketEntity basket;
  final formatter = NumberFormat('###,000');

  BasketWidget({Key? key, required this.basket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width,
            child: ListView.builder(
              primary: false,
              itemCount: basket.productBasket.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 33, top: 46, right: 33),
                  child: CardProductBasket(
                    productBasket: basket.productBasket[index],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: const Color(0x20FFFFFF),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                const Spacer(),
                const Text(
                  'Total',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
                const Spacer(
                  flex: 5,
                ),
                Text(
                  '\$${formatter.format(basket.total)} us',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 26),
            child: Row(
              children: [
                const Spacer(),
                const Text(
                  'Delivery',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
                const Spacer(
                  flex: 5,
                ),
                Text(
                  basket.delivery,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: const Color(0x20FFFFFF),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 44, right: 44, top: 27, bottom: 44),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 54,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
