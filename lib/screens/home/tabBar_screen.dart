import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/MESSAGE_search.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/Starredmessages.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/linked_divices/Linked_devices.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/payment/payment_screen.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/setting_screen.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/allchats.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_status/allstatus.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class tabBar_screen extends StatefulWidget {
  const tabBar_screen({super.key});

  @override
  State<tabBar_screen> createState() => _tabBar_screenState();
}

// flutter flow
class _tabBar_screenState extends State<tabBar_screen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    tabController!.addListener(() {
      tabController!.animateTo(tabController!.index);
      setState(() {
        currentIndex = tabController!.index;
      });
      // if (currentIndex == 0) {
      //   // FormCamra();
      // }
    });
  }

  File? imagefile;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: currentIndex,
      length: 4,
      child: Builder(
        builder: (context) {
          return Scaffold(
            floatingActionButton: currentIndex == 0
                ? null
                : currentIndex == 1
                    ? Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Appcolor.Ddarkgreen, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {
                              App_Service.push_to_screen(
                                  MESSAGE_search_screen(), context);
                            },
                            icon: Icon(
                              Icons.message,
                              color: Appcolor.white,
                            )))
                    : currentIndex == 2
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Appcolor.Ddarkgreen,
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit,
                                        color: Appcolor.white,
                                      ))),
                              Gap(10),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Appcolor.Ddarkgreen,
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: Appcolor.white,
                                      )))
                            ],
                          )
                        : Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Appcolor.Ddarkgreen,
                                shape: BoxShape.circle),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add_call,
                                  color: Appcolor.white,
                                ))),
            appBar: AppBar(
              title: Text('WhatsApp'),
              automaticallyImplyLeading: false,
              elevation: 0,
              foregroundColor: Appcolor.white,
              backgroundColor: Appcolor.Ddarkgreen,
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                PopupMenuButton(
                  itemBuilder: (context) => currentIndex == 0
                      ? []
                      : currentIndex == 1
                          ? [
                              PopupMenuItem(child: Text("New group")),
                              PopupMenuItem(child: Text("New broadcast")),
                              PopupMenuItem(
                                  onTap: () {
                                    App_Service.push_to_screen(
                                        Linked_devices(), context);
                                  },
                                  child: Text("Linked devices")),
                              PopupMenuItem(
                                  onTap: () {
                                    App_Service.push_to_screen(
                                        Starred_messages_screen(), context);
                                  },
                                  child: Text("Starred messages")),
                              PopupMenuItem(
                                  onTap: () {
                                    App_Service.push_to_screen(
                                        Payment_screen(), context);
                                  },
                                  child: Text("Payments")),
                              PopupMenuItem(
                                  onTap: () {
                                    App_Service.push_to_screen(
                                        Setting_screen(), context);
                                  },
                                  child: Text("Settings")),
                            ]
                          : currentIndex == 2
                              ? [
                                  PopupMenuItem(child: Text("Status privacy")),
                                  PopupMenuItem(child: Text("Seattings")),
                                ]
                              : [
                                  PopupMenuItem(child: Text("Clear call log")),
                                  PopupMenuItem(child: Text("Seattings")),
                                ],
                )
              ],
              bottom: TabBar(
                  onTap: (i) {
                    setState(() {
                      currentIndex = i;
                    });
                  },
                  controller: tabController,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                  indicatorColor: Appcolor.white,
                  labelColor: Appcolor.white,
                  labelStyle: AppTextStyle.fs15Normal,
                  tabs: [
                    Tab(
                        icon: Icon(
                      Icons.camera,
                    )),
                    Tab(
                      text: 'CHATS',
                    ),
                    Tab(
                      text: 'STATUS',
                    ),
                    Tab(
                      text: 'CALLS',
                    )
                  ]),
            ),
            body: TabBarView(controller: tabController, children: [
              Icon(Icons.camera),
              All_chats(),
              All_status(),
              Icon(Icons.call),
            ]),
          );
        },
      ),
    );
  }

  // FormCamra() async {
  //   // ignore: invalid_use_of_visible_for_testing_member
  //   var getImage = await ImagePicker.platform
  //       .getImageFromSource(source: ImageSource.camera);

  //   if (getImage != null) {
  //     imagefile = File(getImage.path);
  //     // Navigator.of(context).pop();
  //   }
  //   setState(() {
  //     currentIndex = 1;
  //   });
  // }
}
