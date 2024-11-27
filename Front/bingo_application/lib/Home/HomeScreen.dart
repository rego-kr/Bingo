import 'dart:async';

import 'package:bingo_application/Administrator/AdministratorMain.dart';
import 'package:bingo_application/Widget/SvgIconWidget.dart';
import 'package:bingo_application/theme/colors.dart';
import 'package:bingo_application/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

import '../global/Global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var mapControllerCompleter = Completer();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    statusBarHeight = MediaQuery.of(context).viewPadding.top;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(context)
    );
  }

  Widget mainWidget(BuildContext context){
    return Stack(
      children: [
        naverMap(),
        underStatusBarWidget(context),
      ],
    );
  }

  Widget naverMap(){
    return Positioned.fill(
      child: NaverMap(
        options: const NaverMapViewOptions(
          indoorEnable: true,               // 실내 맵 사용 가능 여부 설정
          locationButtonEnable: false,      // 위치 버튼 표시 여부 설정
          consumeSymbolTapEvents: false,    // 심블 탭 이벤트 소비 여부 설정
        ),

        onMapReady: (controller) async {

          mapControllerCompleter.complete(controller);
        },
      ),
    );
  }

  Widget underStatusBarWidget(BuildContext context){
    return Positioned(
      top: statusBarHeight,
      left: 0,
      right: 0,
      child: header(context),
    );
  }

  Widget header(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),

      child: Container(
        height: 53,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.bg_default,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.border_disabled,
            width: 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 8,
              spreadRadius: 0,
            )
          ]
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            headerPlaceInfoTab(),
            headerMenuBT(context),
          ],
        ),


      ),
    );
  }

  Widget headerPlaceInfoTab(){
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SizedBox(
        height: 44,
        child: Row(
          children: [
            headerSearchContent('ALL'),
            const SvgIconWidget(assetPath: 'assets/icon/chevron_bottom.svg', w: 24, h: 24, color: AppColors.text_default,),
            headerSearchedPlacesNumber(),
          ],
        ),
      ),
    );
  }

  Widget headerSearchContent(String title){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(title != 'ALL') headerIcon() else const SizedBox.shrink(),
        headerSearchTitle(title),
      ],
    );
  }

  Widget headerIcon(){
    return Padding(padding: const EdgeInsets.only(right: 6),
      child: SizedBox(
        width: 22,
        height: 22,

        child: Image.asset(
          'assets/test/bts.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget headerSearchTitle(String title){
    return Text(
      title,
      style: AppTextStyle.headlineBold.copyWith(
        color: AppColors.brand_500
      ),
    );
  }

  Widget headerSearchedPlacesNumber(){
    return Text(
      '000 places',
      style: AppTextStyle.headlineBold.copyWith(
        color: AppColors.text_default
      ),
    );
  }

  Widget headerMenuBT(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(right: 6),

      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {
          await touchVibrate();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdministratorMain())
          );
        },
        child: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          child: const SvgIconWidget(assetPath: 'assets/icon/menu.svg', w: 24, h: 24),
        ),
      ),

    );
  }
}
