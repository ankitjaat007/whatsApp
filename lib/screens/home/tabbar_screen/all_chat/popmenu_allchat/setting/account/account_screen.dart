import 'package:flutter/material.dart';
import 'package:whatsapp/components/listTile/listTile.dart';
import 'package:whatsapp/models/dummydata.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/account/Security.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/account/Two_step_verifi.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/account/changeNumber.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/account/delete_account.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/account/request_account.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Account_setting_screen extends StatelessWidget {
  const Account_setting_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.Ddarkgreen,
        title: Text('Account'),
        titleTextStyle: AppTextStyle.fs20Medium,
        foregroundColor: Appcolor.white,
      ),
      body: Column(
        children: List.generate(
          Dummydata().AllAccountData.length,
          (index) => My_listTile(
            ontap: () {
              onprass(Dummydata().AllAccountData[index]['id'], context);
            },
            leadingIcon: Dummydata().AllAccountData[index]['icons'],
            title: Dummydata().AllAccountData[index]['title'],
          ),
        ),
      ),
    );
  }

  onprass(String id, BuildContext context) {
    switch (id) {
      case "Security":
        return App_Service.push_to_screen(Security_screen(), context);
      case "verification":
        return App_Service.push_to_screen(Two_step_verifi_(), context);
      case "Change_number":
        return App_Service.push_to_screen(Change_number_screen(), context);
      case "Request":
        return App_Service.push_to_screen(Request_account_screen(), context);
      case "Delete":
        return App_Service.push_to_screen(delete_account_screen(), context);
    }
  }
}
