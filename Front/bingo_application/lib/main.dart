import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // StatusBar를 투명하게
      statusBarIconBrightness: Brightness.light, // StatusBar 아이콘을 밝게 설정
    ));

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: Center(
          child: Text(
            '화면 가운데 텍스트',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

