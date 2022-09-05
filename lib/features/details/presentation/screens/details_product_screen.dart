
import 'package:electronics_store/features/details/presentation/widgets/navigation_widget.dart';
import 'package:electronics_store/features/details/presentation/widgets/product_image_carousel_widget.dart';
import 'package:flutter/material.dart';

class DetailsProductScreen extends StatelessWidget {
  const DetailsProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          NavigationWidget(),
          ProductImageCarouselWidget(),
        ],
      ),
    );
  }
}
