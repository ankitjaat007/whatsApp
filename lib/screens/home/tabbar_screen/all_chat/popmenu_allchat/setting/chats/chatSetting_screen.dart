import 'package:flutter/material.dart';
import 'package:whatsapp/components/appBarWidget.dart';
import 'package:whatsapp/components/dialog/my_dialog.dart';
import 'package:whatsapp/components/listTile/listTile.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/chats/wallpaper/Wallpaper_screen.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/chats/chat_backup.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/chats/chat_history.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

import '../../../../../../../models/dummydata.dart';

class Chat_setting_screen extends StatefulWidget {
  const Chat_setting_screen({super.key});

  @override
  State<Chat_setting_screen> createState() => _Chat_setting_screenState();
}

class _Chat_setting_screenState extends State<Chat_setting_screen> {
  bool check1 = false;
  bool check2 = true;
  int colour = 0;
  String theme = Dummydata().Choose_theme[1];
  String font_size = Dummydata().Font_size[1];
  String app_Language = Dummydata().App_Language[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text('Chats')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          App_Service.add_Height(10),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Display',
              style: TextStyle(color: Appcolor.gray),
            ),
          ),
          My_listTile(
            ontap: () {
              showDialog(
                  context: context,
                  builder: (context) => My_dialog_singleSelect(
                      selected: theme,
                      buttonshow: true,
                      data: Dummydata().Choose_theme,
                      dialogTital: 'Choose theme',
                      onDone: (v) => setState(() => theme = v)));
            },
            leadingIcon: Icons.brightness_6,
            title: 'Theme',
            subtitle: theme,
          ),
          My_listTile(
            ontap: () {
              App_Service.push_to_screen(Wallpaper_screen(), context);
            },
            leadingIcon: Icons.wallpaper,
            title: 'Wallpaper',
          ),
          Divider(
            color: Appcolor.lightbrown,
          ),
          App_Service.add_Height(10),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Chat settings',
              style: TextStyle(color: Appcolor.gray),
            ),
          ),
          App_Service.add_Height(10),
          ListTile(
            leading: SizedBox(),
            title: Text('Enter is send'),
            subtitle: Text('Enter key will send your message'),
            trailing: Switch(
                value: check1,
                activeColor: Appcolor.Ddarkgreen,
                inactiveThumbColor: Appcolor.lightgray,
                onChanged: (newvalue) {
                  setState(() {
                    check1 = !check1;
                  });
                }),
          ),
          ListTile(
            leading: SizedBox(),
            title: Text('Media visibility'),
            subtitle:
                Text('Show newly downloaded media in your phone’s gallery'),
            trailing: Switch(
                value: check2,
                activeColor: Appcolor.Ddarkgreen,
                inactiveThumbColor: Appcolor.lightgray,
                onChanged: (newvalue) {
                  setState(() {
                    check2 = !check2;
                  });
                }),
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => My_dialog_singleSelect(
                      selected: font_size,
                      data: Dummydata().Font_size,
                      dialogTital: 'Font size',
                      onDone: (v) => setState(() => font_size = v)));
            },
            leading: SizedBox(),
            title: Text('Font size'),
            subtitle: Text(font_size),
          ),
          Divider(
            color: Appcolor.lightbrown,
          ),
          My_listTile(
            ontap: () {
              showDialog(
                  context: context,
                  builder: (context) => My_dialog_singleSelect(
                      selected: app_Language,
                      data: Dummydata().App_Language,
                      dialogTital: 'App Language',
                      onDone: (v) => setState(() => app_Language = v)));
            },
            leadingIcon: Icons.language,
            title: 'App Language',
            subtitle: app_Language,
          ),
          My_listTile(
            ontap: () {
              App_Service.push_to_screen(Chat_backup_screen(), context);
            },
            leadingIcon: Icons.cloud_upload,
            title: 'Chat backup',
          ),
          My_listTile(
            ontap: () {
              App_Service.push_to_screen(Chat_history_screen(), context);
            },
            leadingIcon: Icons.replay,
            title: 'Chat history',
          ),
        ],
      ),
    );
  }
}
