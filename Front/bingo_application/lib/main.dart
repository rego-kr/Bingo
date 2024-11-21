import 'dart:developer';

import 'package:bingo_application/Splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

Future<void> main() async {
  await _initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // StatusBar를 투명하게
      statusBarIconBrightness: Brightness.dark, // StatusBar 아이콘을 밝게 설정
    ));

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );
  }
}

_initialize() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NaverMapSdk.instance.initialize(
    clientId: 'tb0h58bwym',
    onAuthFailed: (e) => log('네이버 맵 인증오류 : $e', name: 'onAuthFailed')
  );
}




