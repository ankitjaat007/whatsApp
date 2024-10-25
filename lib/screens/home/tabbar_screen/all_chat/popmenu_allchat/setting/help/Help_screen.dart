import 'package:flutter/material.dart';
import 'package:whatsapp/models/dummydata.dart';

import '../../../../../../../components/appBarWidget.dart';

class Help_screen extends StatelessWidget {
  const Help_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Help")),
      body: Column(
          children: List.generate(
              Dummydata().Help_data.length,
              (index) => ListTile(
                    leading: Icon(Dummydata().Help_data[index]['icon']),
                    title: Text(Dummydata().Help_data[index]['title']),
                    subtitle: Dummydata().Help_data[index]['subtitle'] == ''
                        ? null
                        : Text(Dummydata().Help_data[index]['subtitle']),
                  ))),
    );
  }
}
