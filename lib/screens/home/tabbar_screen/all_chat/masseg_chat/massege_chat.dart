import 'dart:io';

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/components/dialog/my_dialog.dart';
import 'package:whatsapp/models/all_models.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

import '../../../../../functions/image_piker.dart';

// ignore: must_be_immutable
class Massege_chat_page extends StatefulWidget {
  ChatData_model chatmodel;
  Massege_chat_page({super.key, required this.chatmodel});

  @override
  State<Massege_chat_page> createState() => _Massege_chat_pageState();
}

class _Massege_chat_pageState extends State<Massege_chat_page> {
  File? profileImage;
  TextEditingController Message_controller = TextEditingController();

  int textLength = 0;

  List<MessageModel> msgList = [];
  @override
  Widget build(BuildContext context) {
    // print(Message_controller.text);
    return Scaffold(
      backgroundColor: Color(0xff899AA2),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Appcolor.Ddarkgreen,
        leading: Image.asset(widget.chatmodel.dp),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatmodel.name),
            Text(
              'online',
              style: AppTextStyle.fs13Normal,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => My_dialog_multipalSelect(
                      style: AppTextStyle.fs16Bold,
                      dialogTital: 'Start video call?',
                      donebutton: 'CALL'),
                );
              },
              icon: Icon(Icons.videocam)),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => My_dialog_multipalSelect(
                      style: AppTextStyle.fs16Bold,
                      dialogTital: 'Start voice call?',
                      donebutton: 'CALL'),
                );
              },
              icon: Icon(Icons.call)),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text("View contact")),
              PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Media, links, and docs")),
              PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Search")),
              PopupMenuItem(
                  onTap: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => My_dialog_singleSelect(
                    //       selected: selected, data: data, onDone: onDone),
                    // );
                  },
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Mute notifications")),
              PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Wallpaper")),
              PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text("More")),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DateChip(
              date: DateTime.now(),
              color: Color(0x558AD3D5),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: msgList.length,
                itemBuilder: (context, i) {
                  return Row(
                    mainAxisAlignment: msgList[i].sendBy == "me"
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      msgList[i].sendBy == "me"
                          ?
                          //  BubbleSpecialThree(
                          //     text: 'Please try and give some feedback on it!',
                          //     color: Color(0xFF1B97F3),
                          //     tail: true,
                          //     textStyle:
                          //         TextStyle(color: Colors.white, fontSize: 16),
                          //   )
                          BubbleSpecialOne(
                              delivered: true,
                              text: msgList[i].msg,
                              color: Color(0xFFE7FFDB),
                              seen: true,
                            )
                          : BubbleSpecialOne(
                              text: msgList[i].msg,
                              isSender: false,
                              color: Color(0xFFE7FFDB),
                              // textStyle: TextStyle(
                              //   fontSize: 20,
                              //   color: Colors.white,
                              // ),
                            ),
                    ],
                  );
                })
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10)
            .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                  controller: Message_controller,
                  onChanged: (v) {
                    setState(() => textLength = v.length);
                  },
                  decoration: InputDecoration(
                      prefixIconColor: Appcolor.black,
                      suffixIconColor: Appcolor.black,
                      contentPadding: EdgeInsets.all(0),
                      fillColor: Appcolor.white,
                      filled: true,
                      prefixIcon: Icon(Icons.emoji_emotions),
                      hintText: 'Message',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Appcolor.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Appcolor.white)),
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          textLength == 0
                              ? Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.link),
                                      onPressed: () async {
                                        String image =
                                            await getImageFormGallery(context);
                                        image.isNotEmpty
                                            ? profileImage = File(image)
                                            : null;
                                        setState(() {});
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.flag_circle),
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          IconButton(
                            icon: Icon(Icons.camera_alt_rounded),
                            onPressed: () async {
                              String image = await getImageFormCamra(context);
                              image.isNotEmpty
                                  ? profileImage = File(image)
                                  : null;
                              setState(() {});
                            },
                          ),
                        ],
                      ))),
            ),
            textLength == 0
                ? Container(
                    margin: EdgeInsets.only(left: 7),
                    decoration: BoxDecoration(
                        color: Appcolor.Ddarkgreen, shape: BoxShape.circle),
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
                  )
                : Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 7),
                        decoration: BoxDecoration(
                            color: Appcolor.Ddarkgreen, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {
                              msgList.add(MessageModel(Message_controller.text,
                                  DateTime.now().toIso8601String(), ""));

                              Message_controller.clear();
                              setState(() {});
                            },
                            icon: Icon(Icons.keyboard_double_arrow_left_sharp)),
                      ),
                      Gap(5),
                      Container(
                        // margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Appcolor.Ddarkgreen, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {
                              msgList.add(MessageModel(Message_controller.text,
                                  DateTime.now().toIso8601String(), "me"));

                              Message_controller.clear();
                              setState(() {});
                            },
                            icon:
                                Icon(Icons.keyboard_double_arrow_right_sharp)),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

class MessageModel {
  String msg, time, sendBy;

  MessageModel(this.msg, this.time, this.sendBy);
}
