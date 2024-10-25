import 'package:flutter/material.dart';
import 'package:whatsapp/components/button/icon_button.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/linked_divices/scan_qr.dart';
import 'package:whatsapp/service/app_icons&images.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Linked_devices extends StatelessWidget {
  const Linked_devices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD9D9D9),
      appBar: AppBar(
        backgroundColor: Appcolor.Ddarkgreen,
        title: Text('Linked devices'),
        titleTextStyle: AppTextStyle.fs20Medium,
        foregroundColor: Appcolor.white,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Appcolor.white, boxShadow: []),
            padding: EdgeInsets.all(15),
            child: Center(
              child: Column(
                children: [
                  Image.asset(AppImages.linked_devices),
                  Text(
                    'Use WhatsAPP on other devices',
                    style: AppTextStyle.fs32Medium,
                    textAlign: TextAlign.center,
                  ),
                  Icon_Button(
                    onpressed: () {
                      App_Service.push_to_screen(Scan_QR(), context);
                    },
                    btnName: 'LINK A DEVICE',
                    bgcolor: Appcolor.Mdarkgreen,
                    textclr: Appcolor.white,
                    radius: 4,
                  )
                ],
              ),
            ),
          ),
          App_Service.add_Height(10),
          Expanded(
            child: Container(
                height: App_Service.getscreenheight(context),
                color: Appcolor.white,
                padding: EdgeInsets.all(15),
                child: ListTile(
                  leading: Image.asset(AppIcons.filter),
                  title: Text('Multi-device beta'),
                  subtitle: Text(
                      'Use up to 4 devices without keeping your phone online. Tap to learn more.'),
                )),
          )
        ],
      ),
    );
  }
}
