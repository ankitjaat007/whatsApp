import 'package:flutter/material.dart';
import 'package:whatsapp/service/app_icons&images.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Security_screen extends StatefulWidget {
  const Security_screen({super.key});

  @override
  State<Security_screen> createState() => _Security_screenState();
}

class _Security_screenState extends State<Security_screen> {
  bool check = false;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          App_Service.add_Height(20),
          Center(child: Image.asset(AppImages.security)),
          App_Service.add_Height(20),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text:
                      'WhatsApp secures your conversations with\nend-to-end encryption. This means you\nmessages, call and status updates stay\nbetween you and the people you choose. Not\neven whatsApp can read or listen to them.'),
              TextSpan(
                  text: ' Learn\nmore', style: TextStyle(color: Appcolor.blue))
            ])),
          ),
          App_Service.add_Height(40),
          Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text('Show security notifications'),
            subtitle: Text.rich(TextSpan(children: [
              TextSpan(
                text:
                    'Get notified when your security code changes for contact.',
              ),
              TextSpan(
                  text: ' Learn more', style: TextStyle(color: Appcolor.blue))
            ])),
            trailing: Switch(
                value: check,
                activeColor: Appcolor.Ddarkgreen,
                inactiveThumbColor: Appcolor.lightgray,
                onChanged: (newvalue) {
                  setState(() {
                    check = !check;
                  });
                }),
          )
        ],
      ),
    );
  }
}
