import 'package:electronics_store/common/app_collors.dart';
import 'package:electronics_store/features/splash/presentation/widgets/logo_company_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: AppColors.darkBlueBackground,
      child: Center(child: LogoCompanyWidget()),
    );
  }
}
