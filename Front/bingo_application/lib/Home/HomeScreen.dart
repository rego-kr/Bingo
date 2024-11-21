import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var mapControllerCompleter = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: naverMap()
    );
  }

  Widget naverMap(){
    return NaverMap(
      options: const NaverMapViewOptions(
        indoorEnable: true,               // 실내 맵 사용 가능 여부 설정
        locationButtonEnable: false,      // 위치 버튼 표시 여부 설정
        consumeSymbolTapEvents: false,    // 심블 탭 이벤트 소비 여부 설정
      ),

      onMapReady: (controller) async {

        mapControllerCompleter.complete(controller);
      },
    );
  }
}
