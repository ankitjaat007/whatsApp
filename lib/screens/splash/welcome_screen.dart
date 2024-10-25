import 'package:flutter/material.dart';
import 'package:whatsapp/components/button/icon_button.dart';
import 'package:whatsapp/screens/login/login_screen.dart';
import 'package:whatsapp/service/app_icons&images.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Welcome_screen extends StatelessWidget {
  const Welcome_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                'Welcome to WhatsApp',
                style: AppTextStyle.fs30Bold,
              ),
            ),
            Center(child: Image.asset(AppImages.qr)),
            Column(
              children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(text: 'Read our '),
                    TextSpan(
                        text: 'Privacy Policy. ',
                        style: TextStyle(color: Appcolor.blue)),
                    TextSpan(text: 'Tap “Agree and continue” to accept the '),
                    TextSpan(
                        text: 'Teams of Service.',
                        style: TextStyle(color: Appcolor.blue)),
                  ]),
                  textAlign: TextAlign.center,
                ),
                App_Service.add_Height(20),
                Icon_Button(
                  btnName: 'AGREE AND CONTINUE',
                  onpressed: () {
                    App_Service.push_and_replace(Login_screen(), context);
                  },
                  bgcolor: Appcolor.Mdarkgreen,
                  textclr: Appcolor.black,
                  radius: 3,
                  width: 0.8,
                ),
              ],
            ),
            Center(
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
