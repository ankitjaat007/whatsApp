import 'package:flutter/material.dart';
import 'package:whatsapp/components/listTile/listTile.dart';
import 'package:whatsapp/models/dummydata.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

import '../../../../../../../components/appBarWidget.dart';

class Manage_storage_screen extends StatelessWidget {
  const Manage_storage_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Manage storage")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: '3.1',
                          style: AppTextStyle.fs35Medium
                              .copyWith(color: Appcolor.Ddarkgreen)),
                      TextSpan(
                          text: 'MB',
                          style: AppTextStyle.fs20Medium
                              .copyWith(color: Appcolor.Ddarkgreen)),
                    ])),
                    Text(
                      'Used',
                      style: TextStyle(color: Appcolor.lightgray),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: '78',
                          style: AppTextStyle.fs35Medium
                              .copyWith(color: Appcolor.lightgray)),
                      TextSpan(
                          text: 'GB',
                          style: AppTextStyle.fs20Medium
                              .copyWith(color: Appcolor.lightgray)),
                    ])),
                    Text(
                      'Free',
                      style: TextStyle(color: Appcolor.lightgray),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: LinearProgressIndicator(
              backgroundColor: Appcolor.lightgray,
              borderRadius: BorderRadius.circular(10),
              minHeight: 8,
              value: 0.3,
              valueColor: AlwaysStoppedAnimation(Appcolor.yellow),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Appcolor.Ddarkgreen,
                    ),
                    Text(
                      'WhatsApp Media',
                      style: TextStyle(color: Appcolor.lightgray),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Appcolor.yellow,
                    ),
                    Text(
                      'Apps and other items',
                      style: TextStyle(color: Appcolor.lightgray),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Appcolor.lightgray,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chats',
                  style: TextStyle(color: Appcolor.lightgray),
                ),
                Icon(
                  Icons.search,
                  color: Appcolor.lightgray,
                )
              ],
            ),
          ),
          ...List.generate(
              Dummydata().Manage_storage_chat.length,
              (index) => My_listTile(
                    leadingImageicon: Dummydata().Manage_storage_chat[index]
                        ['dp'],
                    title: Dummydata().Manage_storage_chat[index]['name'],
                    trailingText:
                        '${Dummydata().Manage_storage_chat[index]['stroag']} KB',
                    trailingTextCLR: Appcolor.lightgray,
                  )),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              '3 chats not displayed because they’re taking up a small amount of storage',
              style: TextStyle(color: Appcolor.lightgray),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
