import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconWidget extends StatelessWidget {
  final String assetPath;
  final Color? color;
  final double w;
  final double h;

  const SvgIconWidget({
    super.key,
    required this.assetPath,
    this.color, // 아이콘 색상을 변경하려면 사용
    required this.w,
    required this.h,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
      child: SvgPicture.asset(
        assetPath,
        color: color,
      ),
    );
  }
}
