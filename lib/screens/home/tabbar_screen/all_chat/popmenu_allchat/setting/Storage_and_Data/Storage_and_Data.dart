import 'package:flutter/material.dart';
import 'package:whatsapp/components/dialog/my_dialog.dart';
import 'package:whatsapp/components/listTile/listTile.dart';
import 'package:whatsapp/models/dummydata.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/Storage_and_Data/Manage_storage.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/Storage_and_Data/Network_usage.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

import '../../../../../../../components/appBarWidget.dart';

class Storage_and_Data_setting_screen extends StatefulWidget {
  const Storage_and_Data_setting_screen({super.key});

  @override
  State<Storage_and_Data_setting_screen> createState() =>
      _Storage_and_Data_setting_screenState();
}

class _Storage_and_Data_setting_screenState
    extends State<Storage_and_Data_setting_screen> {
  String mobile_data = Dummydata().Media_auto_download[0];
  String wifi_data = "All Media";
  String romming = 'No media';
  String uplodequality = Dummydata().Uplode_quality[0];
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Storage and data")),
      body: SingleChildScrollView(
        child: Column(children: [
          My_listTile(
            ontap: () {
              App_Service.push_to_screen(Manage_storage_screen(), context);
            },
            leadingIcon: Icons.folder,
            title: 'Manage storage',
            subtitle: '3.1 MB',
          ),
          Divider(
            thickness: 0.7,
            color: Appcolor.lightbrown,
          ),
          My_listTile(
            ontap: () {
              App_Service.push_to_screen(Network_usage_screen(), context);
            },
            leadingIcon: Icons.data_saver_off,
            title: 'Network usage',
            subtitle: '6.1 MB sent  69.2 MB received',
          ),
          ListTile(
            leading: SizedBox(),
            title: Text('Use less data for calls'),
            trailing: Switch(
                value: check,
                activeColor: Appcolor.Ddarkgreen,
                inactiveThumbColor: Appcolor.lightgray,
                onChanged: (newvalue) {
                  setState(() {
                    check = !check;
                  });
                }),
          ),
          Divider(
            thickness: 0.7,
            color: Appcolor.lightbrown,
          ),
          ListTile(
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Media auto-download'),
                App_Service.add_Height(10),
                Text('Voice messages are always automatically downloaded')
              ],
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => My_dialog_multipalSelect(
                    selected: mobile_data,
                    onDone: (v) => setState(() {
                          mobile_data = v;
                        }),
                    data: Dummydata().Media_auto_download,
                    dialogTital: 'When using mobile data',
                    donebutton: 'Ok'),
              );
            },
            leading: SizedBox(),
            title: Text('When using mobile data'),
            subtitle: Text(mobile_data),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => My_dialog_multipalSelect(
                    selected: wifi_data,
                    onDone: (v) => setState(() {
                          wifi_data = v;
                        }),
                    data: Dummydata().Media_auto_download,
                    dialogTital: 'When connected on Wi-Fi',
                    donebutton: 'Ok'),
              );
            },
            leading: SizedBox(),
            title: Text('When connected on Wi-Fi'),
            subtitle: Text(wifi_data),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => My_dialog_multipalSelect(
                    selected: romming,
                    onDone: (v) => setState(() {
                          romming = v;
                        }),
                    data: Dummydata().Media_auto_download,
                    dialogTital: 'When roaming',
                    donebutton: 'Ok'),
              );
            },
            leading: SizedBox(),
            title: Text('When roaming'),
            subtitle: Text(romming),
          ),
          Divider(
            thickness: 0.7,
            color: Appcolor.lightbrown,
          ),
          ListTile(
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Media upload quality'),
                App_Service.add_Height(10),
                Text('Choose the quality of media files to be sent')
              ],
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => My_dialog_singleSelect(
                  buttonshow: true,
                  dialogTital: 'Photo upload quality',
                  dialogSubtitle:
                      'Best quality photos are larger and can take longer to send',
                  selected: uplodequality,
                  data: Dummydata().Uplode_quality,
                  onDone: (v) => setState(() => uplodequality = v),
                ),
              );
            },
            leading: SizedBox(),
            title: Text('Photo upload quality'),
            subtitle: Text(uplodequality),
          ),
        ]),
      ),
    );
  }
}
