import 'package:electronics_store/common/app_colors.dart';
import 'package:electronics_store/features/home/domain/entities/banner_product_entity.dart';
import 'package:flutter/material.dart';

class HotSalesWidget extends StatelessWidget {
  final List<BannerProductEntity> bannerProduct;

  const HotSalesWidget({Key? key, required this.bannerProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 182,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: bannerProduct.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              //TODO возможно есть решение лучше
              width: MediaQuery.of(context).size.width - 30,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      bannerProduct[index].picture,
                    )),
              ),
              child: Stack(
                children: [
                  Positioned(
                      top: 21,
                      left: 25,
                      child: getIconNew(bannerProduct[index].isNew)),
                  Positioned(
                    top: 59,
                    left: 25,
                    child: Text(
                      bannerProduct[index].title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  Positioned(
                    top: 94,
                    left: 25,
                    child: Text(
                      bannerProduct[index].subtitle,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  Positioned(
                      top: 133,
                      left: 25,
                      child: getButtonBuy(bannerProduct[index].isBuy)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getIconNew(bool isNew) {
    if (isNew) {
      return Container(
        alignment: Alignment.center,
        width: 27.0,
        height: 27.0,
        decoration: const BoxDecoration(
          color: AppColors.orange,
          shape: BoxShape.circle,
        ),
        child: const Text(
          "New",
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      );
    }
    return Container();
  }

  Widget getButtonBuy(bool isBuy) {
    if (isBuy) {
      return SizedBox(
        width: 98,
        height: 23,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
            ),
            child: Text(
              "Buy now!",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            )),
      );
    }
    return Container();
  }
}
