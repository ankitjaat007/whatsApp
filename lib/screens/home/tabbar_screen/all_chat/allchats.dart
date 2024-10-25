import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/controller/all_controller.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/masseg_chat/massege_chat.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class All_chats extends StatelessWidget {
  const All_chats({super.key});

  @override
  Widget build(BuildContext context) {
    final chat = Provider.of<AllController>(context, listen: false);
    final chat_data = chat.getallchat;
    return Column(
      children: [
        ...List.generate(
            chat_data.length,
            (index) => ListTile(
                  onTap: () {
                    App_Service.push_to_screen(
                        Massege_chat_page(chatmodel: chat_data[index]),
                        context);
                  },
                  leading: Image.asset(chat_data[index].dp),
                  title: Text(chat_data[index].name),
                  subtitle: Row(
                    children: [Text(chat_data[index].subtitle)],
                  ),
                  trailing: Column(
                    children: [
                      Text('5:45'),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Appcolor.lightgreen, shape: BoxShape.circle),
                        child: Text('4'),
                      )
                    ],
                  ),
                ))
      ],
    );
  }
}
