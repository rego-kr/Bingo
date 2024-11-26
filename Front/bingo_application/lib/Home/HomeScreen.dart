import 'dart:async';

import 'package:bingo_application/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var mapControllerCompleter = Completer();
  late double statusBarHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    statusBarHeight = MediaQuery.of(context).viewPadding.top;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget()
    );
  }

  Widget mainWidget(){
    return Stack(
      children: [
        naverMap(),
        underStatusBarWidget(),
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

  Widget underStatusBarWidget(){
    return Positioned(
      top: statusBarHeight,
      left: 0,
      right: 0,
      child: header(),
    );
  }

  Widget header(){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 4),

      child: Container(
        height: 44,
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


      ),
    );
  }
}
