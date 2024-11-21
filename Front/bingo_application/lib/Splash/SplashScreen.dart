import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Home/HomeScreen.dart';
import '../theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brand_40,
      body: Center(
        child: Image.asset(
          'assets/icon/splash_center.png',
          width: 146,
          height: 199,
        )
      ),
    );
  }
}
