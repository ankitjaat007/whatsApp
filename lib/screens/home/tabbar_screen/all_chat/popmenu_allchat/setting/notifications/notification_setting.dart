import 'package:flutter/material.dart';
import 'package:whatsapp/components/dialog/my_dialog.dart';
import 'package:whatsapp/components/listTile/listTile.dart';
import 'package:whatsapp/components/listTile/swichButton_listTile.dart';
import 'package:whatsapp/models/dummydata.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

import '../../../../../../../components/appBarWidget.dart';

class Notification_setting_screen extends StatefulWidget {
  const Notification_setting_screen({super.key});

  @override
  State<Notification_setting_screen> createState() =>
      _Notification_setting_screenState();
}

class _Notification_setting_screenState
    extends State<Notification_setting_screen> {
  String vibrate = Dummydata().Vibrate[1];
  String group_vibrate = Dummydata().Vibrate[1];
  String light = Dummydata().Light[4];
  String group_light = Dummydata().Light[4];
  @override
  Widget build(BuildContext context) {
    bool tone = true;
    bool messages_Notifications = true;
    bool groups_Notifications = true;
    return Scaffold(
      appBar: CustomAppBar(title: Text("Notifications")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Common_switch_tile(
              title: 'Conversation tones',
              boolvalue: tone,
              subtitle: 'Play sounds for incoming and outgoing messages.',
            ),
            Divider(
              thickness: 0.7,
              color: Appcolor.lightbrown,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Messages',
                style: TextStyle(color: Appcolor.lightgray),
              ),
            ),
            My_listTile(
              title: 'Notification tone',
              subtitle: 'Default (WaterDrop_preview.ogg)',
            ),
            My_listTile(
              ontap: () {
                showDialog(
                  context: context,
                  builder: (context) => My_dialog_singleSelect(
                    dialogTital: 'Vibrate',
                    selected: vibrate,
                    data: Dummydata().Vibrate,
                    onDone: (v) => setState(() => vibrate = v),
                  ),
                );
              },
              title: 'Vibrate',
              subtitle: vibrate,
            ),
            My_listTile(
              ontap: () {
                showDialog(
                  context: context,
                  builder: (context) => My_dialog_multipalSelect(
                      style: AppTextStyle.fs16Bold,
                      dialogTital:
                          'Popup notifications are no longer avilable in your version of Android',
                      donebutton: 'OK'),
                );
              },
              title: 'Popup notification',
              subtitle: 'Not available',
            ),
            My_listTile(
              ontap: () {
                showDialog(
                  context: context,
                  builder: (context) => My_dialog_singleSelect(
                    dialogTital: 'Light',
                    selected: light,
                    data: Dummydata().Light,
                    onDone: (v) => setState(() => light = v),
                  ),
                );
              },
              title: 'Light',
              subtitle: light,
            ),
            Common_switch_tile(
              title: 'Use high priority notifications',
              boolvalue: messages_Notifications,
              subtitle:
                  'Show previews of notifications at the top of the screen',
            ),
            Divider(
              thickness: 0.7,
              color: Appcolor.lightbrown,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Groups',
                style: TextStyle(color: Appcolor.lightgray),
              ),
            ),
            My_listTile(
              title: 'Notification tone',
              subtitle: 'Default (WaterDrop_preview.ogg)',
            ),
            My_listTile(
              ontap: () {
                showDialog(
                  context: context,
                  builder: (context) => My_dialog_singleSelect(
                    dialogTital: 'Vibrate',
                    selected: group_vibrate,
                    data: Dummydata().Vibrate,
                    onDone: (v) => setState(() => group_vibrate = v),
                  ),
                );
              },
              title: 'Vibrate',
              subtitle: group_vibrate,
            ),
            My_listTile(
              ontap: () {
                showDialog(
                  context: context,
                  builder: (context) => My_dialog_singleSelect(
                    dialogTital: 'Light',
                    selected: group_light,
                    data: Dummydata().Light,
                    onDone: (v) => setState(() => group_light = v),
                  ),
                );
              },
              title: 'Light',
              subtitle: group_light,
            ),
            Common_switch_tile(
              title: 'Use high priority notifications',
              boolvalue: groups_Notifications,
              subtitle:
                  'Show previews of notifications at the top of the screen',
            ),
          ],
        ),
      ),
    );
  }
}
