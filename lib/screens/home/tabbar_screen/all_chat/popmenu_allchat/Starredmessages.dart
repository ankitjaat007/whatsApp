import 'package:flutter/material.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Starred_messages_screen extends StatelessWidget {
  const Starred_messages_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.Ddarkgreen,
        title: Text('Starred messages'),
        titleTextStyle: AppTextStyle.fs20Medium,
        foregroundColor: Appcolor.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                  color: Appcolor.Mdarkgreen, shape: BoxShape.circle),
              child: Icon(
                Icons.star,
                color: Appcolor.white,
                size: 80,
              ),
            ),
            App_Service.add_Height(30),
            Text(
              'Tap and hold on any message\nin any chat to star it, so you\ncan easily find it later.',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
