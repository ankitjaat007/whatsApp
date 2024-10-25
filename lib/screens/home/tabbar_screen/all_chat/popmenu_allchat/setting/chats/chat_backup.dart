import 'package:flutter/material.dart';
import 'package:whatsapp/components/appBarWidget.dart';
import 'package:whatsapp/components/button/icon_button.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Chat_backup_screen extends StatefulWidget {
  const Chat_backup_screen({super.key});

  @override
  State<Chat_backup_screen> createState() => _Chat_backup_screenState();
}

class _Chat_backup_screenState extends State<Chat_backup_screen> {
  bool check2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text('Chats backup')),
      body: Column(
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                'Last Backup',
                style: TextStyle(color: Appcolor.gray),
              ),
            ),
            leading: Icon(Icons.cloud_upload_sharp),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Back up your messages and media to Google Drive. You can restore them when you reinstall WhatsApp. Your messages will also back up to your phone’s internal storage.'),
                App_Service.add_Height(20),
                Text(
                  'Local: 2:00 am\nGoogle Drive: Never',
                  style:
                      AppTextStyle.fs15Normal.copyWith(color: Appcolor.black),
                ),
                App_Service.add_Height(10),
                Icon_Button(
                  width: 0.1,
                  btnName: 'BACK UP',
                  bgcolor: Appcolor.Ddarkgreen,
                  textclr: Appcolor.black,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Appcolor.lightbrown,
          ),
          ListTile(
            leading: Icon(Icons.add_to_drive_sharp),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                'Google Drive settings',
                style: TextStyle(color: Appcolor.gray),
              ),
            ),
            subtitle: Column(
              children: [
                Text(
                    'Messages and media backed up in Google Drive are not protected by WhatsApp end-to-end encryption.'),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 0),
                  title: Text('Back up to Google Drive'),
                  subtitle: Text('Never'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 0),
                  title: Text('Google Account'),
                  subtitle: Text('None selected'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 0),
                  title: Text('Back up over'),
                  subtitle: Text('Wi-Fi only'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 0),
                  title: Text('Include videos'),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
