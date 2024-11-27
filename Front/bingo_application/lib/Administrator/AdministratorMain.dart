import 'package:bingo_application/Administrator/CategoryWidgetForManage.dart';
import 'package:bingo_application/theme/colors.dart';
import 'package:bingo_application/theme/text_style.dart';
import 'package:flutter/material.dart';

import '../Widget/SvgIconWidget.dart';
import '../global/Global.dart';

class AdministratorMain extends StatefulWidget {
  const AdministratorMain({super.key});

  @override
  State<AdministratorMain> createState() => _AdministratorMainState();
}

class _AdministratorMainState extends State<AdministratorMain> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg_default,
      body: mainWidget(context),
    );
  }

  Widget mainWidget(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topHeader(context),
        Expanded(child: scrollableContent()),
      ],
    );
  }

  Widget topHeader(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight + 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          backBT(context),
          Text(
            '관리자 메인',
            style: AppTextStyle.bodyBold.copyWith(
              color: AppColors.text_default
            ),
          ),
        ],
      ),
    );
  }

  Widget backBT(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 4),

      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {
          await touchVibrate();
          Navigator.pop(context);
        },
        child: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          child: const SvgIconWidget(assetPath: 'assets/icon/back_android.svg', w: 24, h: 24),
        ),
      ),
    );
  }

  Widget scrollableContent(){
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            statisticsInfoTab(),
            mainDivider(),
            categoriesManagementTab(),
          ],
        ),
      ),
    );
  }

  Widget statisticsInfoTab(){
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(

        children: [
          statisticsInfoTabTitle(),
          statisticsInfoCountTab(),
        ],
      ),
    );
  }

  Widget statisticsInfoTabTitle(){
    return Text(
      '카테고리/장소 통계',
      style: AppTextStyle.title3Bold.copyWith(
        color: AppColors.text_default
      ),
    );
  }

  Widget statisticsInfoCountTab(){
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 32, left: 32),

      child: Container(
        height: 68,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: AppColors.divider_default),
              borderRadius: BorderRadius.circular(8),
            )
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            statisticsOfCategoriesInfo(),

            const SizedBox(width: 10,),
            Container(width: 0.5, color: AppColors.divider_strong,),
            const SizedBox(width: 10,),

            statisticsOfPlacesInfo(),

            const SizedBox(width: 10,),
            Container(width: 0.5, color: AppColors.divider_strong,),
            const SizedBox(width: 10,),

            statisticsOfViewsInfo(),
          ],
        ),
      ),
    );
  }

  Widget statisticsOfCategoriesInfo(){
    return Expanded(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '총 카테고리',
          style: AppTextStyle.subheadBold.copyWith(
            color: AppColors.text_default
          ),
        ),

        const SizedBox(height: 4,),

        Text(
          '24개',
          style: AppTextStyle.bodyBold.copyWith(
            color: AppColors.brand_500
          ),
        ),
      ],
    ));
  }

  Widget statisticsOfPlacesInfo(){
    return Expanded(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '총 장소',
          style: AppTextStyle.subheadBold.copyWith(
              color: AppColors.text_default
          ),
        ),

        const SizedBox(height: 4,),

        Text(
          '432개',
          style: AppTextStyle.bodyBold.copyWith(
              color: AppColors.brand_500
          ),
        ),
      ],
    ));
  }

  Widget statisticsOfViewsInfo(){
    return Expanded(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '총 장소',
          style: AppTextStyle.subheadBold.copyWith(
              color: AppColors.text_default
          ),
        ),

        const SizedBox(height: 4,),

        Text(
          '${formatWithCommas(10419)}회',
          style: AppTextStyle.bodyBold.copyWith(
              color: AppColors.brand_500
          ),
        ),
      ],
    ));
  }

  Widget mainDivider(){
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 32),
      child: Container(
        height: 8,
        color: AppColors.bg_deep,
      ),
    );
  }

  Widget categoriesManagementTab(){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '카테고리 관리',
            style: AppTextStyle.title3Bold.copyWith(
              color: AppColors.text_default
            ),
          ),

          const SizedBox(height: 16,),

          categoriesList()
        ],
      ),
    );
  }

  Widget categoriesList(){
    //테스트 데이터 생성
    final List<Map<String, dynamic>> categories = List.generate(50, (index) {
      return {
        'imageUrl': 'assets/test/nct127.png', // 예시 이미지 경로
        'name': '그룹 ${index*100000 - index*10000}',
        'count': index * 3,
        'colorCode': 0xFF000000 + (index * 0x0023F0), // 임의 색상 생성
      };
    });

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        ...categories.map((category){
          return CategoryWidgetForManage(
            imageUrl: category['imageUrl'],
            name: category['name'],
            count: category['count'],
            colorCode: category['colorCode'],
          );
        }),

        addCategoryBT(),
      ],
    );
  }

  Widget addCategoryBT(){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        await touchVibrate();
      },

      child: Container(
        width: 150,
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: ShapeDecoration(
          color: AppColors.brand_500,

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
            Text(
              '+',
              style: AppTextStyle.bodyBold.copyWith(
                color: AppColors.bg_default
              ),
            ),

            const SizedBox(width: 6,),

            Text(
              '새 카테고리 추가',
              style: AppTextStyle.bodyBold.copyWith(
                color: AppColors.bg_default
              ),
            ),
          ],
        ),
      ),
    );
  }
}


