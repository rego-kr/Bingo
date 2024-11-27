import 'package:intl/intl.dart';
import 'package:vibration/vibration.dart';

const int SPLASH_TIME = 500;
late double statusBarHeight;


Future<void> touchVibrate() async {
  bool? hasVibrator = await Vibration.hasVibrator();

  if(hasVibrator == true){
    Vibration.vibrate(duration: 10, amplitude: 130);
  }
}

String formatWithCommas(num number) {
  final formatter = NumberFormat('#,###');
  return formatter.format(number);
}