import 'package:electronics_store/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: AppColors.darkBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: const [
              Icon(
                Icons.circle,
                color: Colors.white,
                size: 8,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                'Explorer',
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          GestureDetector(
              onTap: () {}, child: SvgPicture.asset('assets/icons/shop.svg')),
          GestureDetector(
              onTap: () {},
              child: SvgPicture.asset('assets/icons/favorite.svg')),
          GestureDetector(
              onTap: () {}, child: SvgPicture.asset('assets/icons/person.svg')),
        ],
      ),
    );
  }
}
