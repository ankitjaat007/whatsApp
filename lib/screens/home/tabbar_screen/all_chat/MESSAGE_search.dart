import 'package:flutter/material.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class MESSAGE_search_screen extends StatelessWidget {
  const MESSAGE_search_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.Ddarkgreen,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select contact'),
            Text(
              '365 contacts',
              style: AppTextStyle.fs15Normal,
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Invite a friend")),
              PopupMenuItem(child: Text("Contacts")),
              PopupMenuItem(child: Text("Refresh")),
              PopupMenuItem(child: Text("Help")),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                foregroundColor: Appcolor.black,
                backgroundColor: Appcolor.Ddarkgreen,
                child: Icon(Icons.group)),
            title: Text('New group'),
          ),
          ListTile(
            leading: CircleAvatar(
                foregroundColor: Appcolor.black,
                backgroundColor: Appcolor.Ddarkgreen,
                child: Icon(Icons.person_add)),
            title: Text('New group'),
          ),
          ListTile(
            subtitle: Text('Contacts on WhatsApp'),
          )
        ],
      ),
    );
  }
}
