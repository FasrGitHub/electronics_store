import 'package:electronics_store/common/app_colors.dart';
import 'package:flutter/material.dart';

class LogoCompanyWidget extends StatelessWidget {
  const LogoCompanyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget orangeCircleLogo = Container(
      width: 132.0,
      height: 132.0,
      decoration: const BoxDecoration(
        color: AppColors.orangeBackground,
        shape: BoxShape.circle,
      ),
    );
    return SizedBox(
      width: 300.0,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          orangeCircleLogo,
          const Positioned(
            top: 30,
            left: 120,
            child: Text(
              "Ecommerce",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Positioned(
            top: 65,
            left: 120,
            child: Text(
              "Concept",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
