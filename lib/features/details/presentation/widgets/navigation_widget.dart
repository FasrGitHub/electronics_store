import 'package:electronics_store/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          const Spacer(),
          Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              color: AppColors.darkBlue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          const Text(
            'Product Details',
            style: TextStyle(fontSize: 23, color: Colors.black),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/shop.svg'),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
