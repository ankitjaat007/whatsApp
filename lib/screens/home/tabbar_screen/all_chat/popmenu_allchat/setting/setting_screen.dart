import 'package:flutter/material.dart';
import 'package:whatsapp/components/listTile/listTile.dart';
import 'package:whatsapp/models/dummydata.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/Storage_and_Data/Storage_and_Data.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/account/account_screen.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/chats/chatSetting_screen.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/help/Help_screen.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/notifications/notification_setting.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/profile_screen.dart';
import 'package:whatsapp/service/app_icons&images.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Setting_screen extends StatelessWidget {
  const Setting_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.Ddarkgreen,
        title: Text('Settings'),
        titleTextStyle: AppTextStyle.fs20Medium,
        foregroundColor: Appcolor.white,
      ),
      body: Column(
        children: [
          My_listTile(
            ontap: () {
              App_Service.push_to_screen(Profile_screen(), context);
            },
            leadingImageicon: AppIcons.profile,
            title: 'Susi Franklin',
            subtitle: 'Hey there! Iam using WhatsApp.',
            tralingImg: AppIcons.profile_qr,
          ),
          Divider(
            thickness: 1.5,
          ),
          ...List.generate(
              Dummydata().AllsettingData.length,
              (index) => My_listTile(
                    ontap: () {
                      onprass(Dummydata().AllsettingData[index]['id'], context);
                    },
                    leadingImageicon: Dummydata().AllsettingData[index]
                        ['icons'],
                    title: Dummydata().AllsettingData[index]['title'],
                    subtitle: Dummydata().AllsettingData[index]['subtile'],
                  )),
        ],
      ),
    );
  }

  onprass(String id, BuildContext context) {
    switch (id) {
      case "Account":
        return App_Service.push_to_screen(Account_setting_screen(), context);
      case "Chats":
        return App_Service.push_to_screen(Chat_setting_screen(), context);
      case "Notifications":
        return App_Service.push_to_screen(
            Notification_setting_screen(), context);
      case "Storage":
        return App_Service.push_to_screen(
            Storage_and_Data_setting_screen(), context);
      case "Help":
        return App_Service.push_to_screen(Help_screen(), context);
    }
  }
}
