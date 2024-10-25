import 'package:flutter/material.dart';
import 'package:whatsapp/components/dialog/my_dialog.dart';
import 'package:whatsapp/service/text_styleSheet.dart';
import '../../../../../../../components/appBarWidget.dart';
import '../../../../../../../components/listTile/listTile.dart';
import '../../../../../../../models/dummydata.dart';

class Chat_history_screen extends StatefulWidget {
  const Chat_history_screen({super.key});

  @override
  State<Chat_history_screen> createState() => _Chat_history_screenState();
}

class _Chat_history_screenState extends State<Chat_history_screen> {
  String clear_chat = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text('Chat history')),
      body: Column(
        children: List.generate(
            Dummydata().AllChat_history.length,
            (index) => My_listTile(
                  ontap: () {
                    onprass(Dummydata().AllChat_history[index]['id'], context);
                  },
                  leadingIcon: Dummydata().AllChat_history[index]['icons'],
                  title: Dummydata().AllChat_history[index]['title'],
                )),
      ),
    );
  }

  onprass(String id, BuildContext context) {
    switch (id) {
      case 'Archive_all_chats':
        return showDialog(
            context: context,
            builder: (context) => My_dialog_multipalSelect(
                  dialogTital: 'Are you sure you want to archive ALL chats?',
                  style: AppTextStyle.fs15Normal,
                  donebutton: 'ok',
                ));
      case "Clear_all_chats":
        return showDialog(
            context: context,
            builder: (context) => My_dialog_multipalSelect(
                  data: Dummydata().Clear_chat,
                  dialogTital: 'Clear messages in chats?',
                  subtitle: 'Messages in all chats will disappear forever.',
                  donebutton: 'CLEAR MESSAGES',
                ));
      case "Delete_all_chats":
        return showDialog(
            context: context,
            builder: (context) => My_dialog_multipalSelect(
                  data: ['Delete media in chats'],
                  dialogTital:
                      'Are you sure you want to delete ALL chats and their messages?',
                  style: AppTextStyle.fs15Normal,
                  donebutton: 'DELETE',
                ));
    }
  }
}
