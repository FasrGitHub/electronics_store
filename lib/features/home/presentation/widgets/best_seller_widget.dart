import 'package:electronics_store/common/app_colors.dart';
import 'package:electronics_store/features/detais/presentation/screens/details_product_screen.dart';
import 'package:electronics_store/features/home/domain/entities/product_entity.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BestSellerWidget extends StatelessWidget {
  final List<ProductEntity> products;
  final formatter = NumberFormat('###,###,000');

  BestSellerWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 21),
      height: MediaQuery.of(context).size.width,
      child: GridView.builder(
        primary: false,
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 14,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            //Todo в реальных проектах сюда нужно передавать индификатор товара
                              builder: (context) => DetailsProductScreen()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ExtendedImage.network(
                            products[index].picture,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.contain,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 21,
                            ),
                            Text(
                              '\$${formatter.format(products[index].discountPrice)}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              '\$${formatter.format(products[index].priceWithoutDiscount)}',
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 21),
                          child: Text(
                            products[index].title,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      //TODO реализовать добавление в фавориты при помощи блока и базы данных
                      onTap: () {},
                      child: Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          products[index].isFavorites
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 11,
                          color: AppColors.orange,
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
