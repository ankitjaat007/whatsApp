import 'package:flutter/material.dart';
import 'package:whatsapp/functions/all_function.dart';
import 'package:whatsapp/screens/splash/welcome_screen.dart';
import 'package:whatsapp/service/appConfig.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  int valuechane1 = 0;
  int valuechane2 = 0;
  int valuechane3 = 0;
  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    await All_function.getallchat(context);
    await All_function.getallWallpaper(context);
    await Future.delayed(Duration(seconds: 2), () => valuechane1 = 1);
    setState(() {});

    await Future.delayed(Duration(seconds: 2), () => valuechane2 = 2);
    setState(() {});

    await Future.delayed(Duration(seconds: 2), () => valuechane3 = 3);

    setState(() {});
    await Future.delayed(Duration(seconds: 2), () {
      App_Service.push_and_replace(Welcome_screen(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          AppConfig.splash_BG,
          fit: BoxFit.cover,
          height: App_Service.getscreenheight(context),
          width: App_Service.getscreenwidth(context),
        ),
        Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              valuechane1 == 1
                  ? valuechane2 == 2
                      ? Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Appcolor.lightgreen,
                              borderRadius: BorderRadius.circular(20)),
                          height: 50,
                          width: 50,
                          child: Image.asset(AppConfig.logo),
                        )
                      : Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Appcolor.lightgreen,
                              borderRadius: BorderRadius.circular(20)),
                          height: 50,
                          width: 50,
                          child: Image.asset(AppConfig.logo),
                        )
                  : Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Appcolor.lightgreen,
                          borderRadius: BorderRadius.circular(20)),
                      height: 94,
                      width: 94,
                      child: Image.asset(
                        AppConfig.logo,
                        scale: 0.5,
                      ),
                    ),
              Text(
                'WhatsApp',
                style: AppTextStyle.fs35Medium,
              )
            ],
          ),
        ),
        valuechane3 == 3
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircularProgressIndicator(
                      color: Appcolor.lightgreen,
                    ),
                    Text(
                      'Loading...',
                      style: TextStyle(
                          color: Appcolor.lightgreen,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            : valuechane2 == 2
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'from',
                          style: TextStyle(color: Appcolor.gray),
                        ),
                        Text(
                          'FACEBOOK',
                          style: AppTextStyle.fs15Normal,
                        )
                      ],
                    ),
                  )
                : SizedBox()
      ]),
    );
  }
}
