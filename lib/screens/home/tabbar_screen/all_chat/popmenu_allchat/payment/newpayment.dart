import 'package:flutter/material.dart';
import 'package:whatsapp/components/button/icon_button.dart';
import 'package:whatsapp/components/listTile/listTile.dart';
import 'package:whatsapp/service/app_icons&images.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class New_payment_screen extends StatelessWidget {
  const New_payment_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            App_Service.add_Height(10),
            Center(
                child: Text(
              'Payments',
              style: AppTextStyle.fs16Bold,
            )),
            App_Service.add_Height(10),
            Image.asset(AppImages.payment),
            Text(
              'Send and recieve money securely, right\nwhere you chat',
              style: AppTextStyle.fs16Bold,
              textAlign: TextAlign.center,
            ),
            App_Service.add_Height(10),
            My_listTile(
              leadingImageicon: AppIcons.people2,
              title: 'Crores of people are already using payments on whatsApp.',
            ),
            Spacer(),
            Icon_Button(
              btnName: 'CONTINUE',
              bgcolor: Appcolor.Ddarkgreen,
              textclr: Appcolor.white,
              width: 0.8,
              radius: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppIcons.bhim),
                App_Service.add_Width(10),
                Image.asset(AppIcons.upi),
              ],
            )
          ],
        ),
      ),
    );
  }
}
