import 'package:bingo_application/theme/colors.dart';
import 'package:bingo_application/theme/text_style.dart';
import 'package:flutter/material.dart';

class CategoryWidgetForManage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int count;
  final int colorCode;

  const CategoryWidgetForManage({
    super.key, 
    required this.imageUrl, required this.name, required this.count, required this.colorCode
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 36,
        padding: const EdgeInsets.only(left: 8, right: 12),
      
        decoration: ShapeDecoration(
          color: AppColors.gray_0,
      
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.2, color: AppColors.border_disabled),
            borderRadius: BorderRadius.circular(100),
          ),
      
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              offset: const Offset(0, 2),
              spreadRadius: 0
            )
          ],
        ),
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
      
          children: [
            repImage(),
            const SizedBox(width: 6,),
            nameAndCount()
          ],
        ),
      ),
    );
  }

  Widget repImage(){
    return Container(
      width: 22,
      height: 22,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: Image.asset(imageUrl).image,
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),
    );
  }

  Widget nameAndCount(){
    return Text(
      '$name($count)',
      style: AppTextStyle.bodyBold.copyWith(
        color: Color(colorCode)
      ),
    );
  }
}
