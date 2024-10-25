import 'package:flutter/material.dart';
import 'package:whatsapp/components/button/icon_button.dart';
import 'package:whatsapp/service/app_icons&images.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Change_number_screen extends StatelessWidget {
  const Change_number_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.Ddarkgreen,
        title: Text('Security'),
        titleTextStyle: AppTextStyle.fs20Medium,
        foregroundColor: Appcolor.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            App_Service.add_Height(20),
            Center(child: Image.asset(AppImages.change_number)),
            App_Service.add_Height(20),
            Text(
              'Changing your phone number will migrate your account info, groups & settings.',
              style: AppTextStyle.fs15Normal,
            ),
            App_Service.add_Height(20),
            Text(
              'Before proceeding, please confirm that you are able to receive SMS or calls at your new number.',
              style: AppTextStyle.fs13Normal.copyWith(color: Appcolor.gray),
            ),
            App_Service.add_Height(20),
            Text(
                'If you have both a new phone & a new number, first change your number on your old phone.',
                style: AppTextStyle.fs13Normal.copyWith(color: Appcolor.gray)),
            Spacer(),
            Center(
              child: Icon_Button(
                btnName: 'NEXT',
                bgcolor: Appcolor.Ddarkgreen,
                width: 0.1,
                textclr: Appcolor.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
