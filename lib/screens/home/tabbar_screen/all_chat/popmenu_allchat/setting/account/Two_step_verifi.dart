import 'package:flutter/material.dart';
import 'package:whatsapp/components/button/icon_button.dart';
import 'package:whatsapp/service/app_icons&images.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Two_step_verifi_ extends StatelessWidget {
  const Two_step_verifi_({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.Ddarkgreen,
        title: Text('Security'),
        titleTextStyle: AppTextStyle.fs20Medium,
        foregroundColor: Appcolor.white,
      ),
      body: Column(
        children: [
          App_Service.add_Height(20),
          Center(child: Image.asset(AppImages.security)),
          App_Service.add_Height(20),
          Text(
            'For added security, enable two-step verification, which\nwill require a PIN when registering your phone number\nwith WhatsApp again.',
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Icon_Button(
            btnName: 'ENABLE',
            bgcolor: Appcolor.Ddarkgreen,
            width: 0.1,
            textclr: Appcolor.white,
          )
        ],
      ),
    );
  }
}
