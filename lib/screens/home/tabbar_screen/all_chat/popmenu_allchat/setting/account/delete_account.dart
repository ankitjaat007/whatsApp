import 'package:flutter/material.dart';
import 'package:whatsapp/components/button/icon_button.dart';
import 'package:whatsapp/models/dummydata.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class delete_account_screen extends StatelessWidget {
  const delete_account_screen({super.key});

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
        children: [
          ListTile(
            leading: Icon(
              Icons.warning_sharp,
              color: Appcolor.red,
            ),
            title: Text(
              'Deleting your account will:',
              style: TextStyle(color: Appcolor.red),
            ),
            subtitle: Column(
              children: [
                ...List.generate(
                  Dummydata().DeletingPoint.length,
                  (index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '•',
                        style: AppTextStyle.fs16Bold
                            .copyWith(color: Appcolor.lightbrown),
                      ),
                      App_Service.add_Width(5),
                      Expanded(child: Text(Dummydata().DeletingPoint[index]))
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Appcolor.lightbrown,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.logout_sharp,
                  color: Appcolor.black,
                ),
                App_Service.add_Width(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Change number instead?'),
                      App_Service.add_Height(10),
                      Icon_Button(
                        btnName: 'CHANGE NUMBER',
                        textclr: Appcolor.white,
                        bgcolor: Appcolor.Ddarkgreen,
                        width: 0.1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Appcolor.lightbrown,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Text(
                'To delete your account, confirm your country code and enter your phone number.'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Country'),
              Icon_Button(
                btnName: 'DELETE MY ACCOUNT',
                textclr: Appcolor.white,
                bgcolor: Appcolor.red,
                width: 0.62,
              )
            ],
          )
        ],
      ),
    );
  }
}
