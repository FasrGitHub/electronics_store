import 'package:electronics_store/common/app_colors.dart';
import 'package:electronics_store/features/home/presentation/screens/home_screen.dart';
import 'package:electronics_store/features/splash/presentation/widgets/logo_company_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Electronics Store',
      home: Scaffold(
          backgroundColor: AppColors.darkBlue,
          body: Center(child: LogoCompanyWidget())),
    );
  }
}
