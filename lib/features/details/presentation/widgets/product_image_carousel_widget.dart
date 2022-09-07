import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselWidget extends StatelessWidget {
  final List<String> images;

  const ProductImageCarouselWidget({Key? key, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(),
        child: CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, itemIndex, pageViewIndex) =>
              bodyImage(context, itemIndex),
          options: CarouselOptions(
            viewportFraction: 0.6,
            height: 335,
            enlargeCenterPage: true,
            // height: MediaQuery.of(context).size.width,
          ),
        ));
  }

  Widget bodyImage(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: -5,
            blurRadius: 10,
            offset: const Offset(0,6)
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExtendedImage.network(
        images[index],
        fit: BoxFit.contain,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
