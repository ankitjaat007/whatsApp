import 'package:flutter/material.dart';
import 'package:whatsapp/components/button/icon_button.dart';
import 'package:whatsapp/service/app_icons&images.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Scan_QR extends StatelessWidget {
  const Scan_QR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.Ddarkgreen,
        title: Text('Scan QR code'),
        titleTextStyle: AppTextStyle.fs20Medium,
        foregroundColor: Appcolor.white,
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xffD9D9D9),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text(
                'To use WhatsApp web, go to web.whatsapp.com on your computer.',
                style: TextStyle(
                  color: Appcolor.gray,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(20),
                  color: Color(0xffD9D9D9),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Image.asset(AppImages.scan_qr),
                      ),
                      Icon_Button(
                        btnName: 'OK',
                        bgcolor: Appcolor.Mdarkgreen,
                        textclr: Appcolor.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
