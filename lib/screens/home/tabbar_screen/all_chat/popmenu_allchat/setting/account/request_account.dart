import 'package:flutter/material.dart';
import 'package:whatsapp/components/appBarWidget.dart';
import 'package:whatsapp/components/button/icon_button.dart';
import 'package:whatsapp/components/listTile/listTile.dart';
import 'package:whatsapp/service/app_icons&images.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Request_account_screen extends StatelessWidget {
  const Request_account_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Security")),
      body: Column(
        children: [
          App_Service.add_Height(20),
          Center(child: Image.asset(AppImages.request_info)),
          App_Service.add_Height(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text:
                      'Create a report of your WhatsApp account information and settings, which you can access or port to another app. This report does not include your messages.'),
              TextSpan(
                  text: ' Learn more', style: TextStyle(color: Appcolor.blue))
            ])),
          ),
          Divider(
            thickness: 1,
          ),
          My_listTile(
            leadingIcon: Icons.insert_drive_file_rounded,
            title: 'Request report',
          ),
          Divider(
            thickness: 1,
          ),
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
    );
  }
}
