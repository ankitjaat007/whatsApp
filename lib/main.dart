import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/controller/all_controller.dart';
import 'package:whatsapp/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AllController())],
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splash_screen(),
        ),
      ),
    );
  }
}
