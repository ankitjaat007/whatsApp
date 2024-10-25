import 'package:flutter/material.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

// ignore: must_be_immutable
class Common_switch_tile extends StatefulWidget {
  String title;
  String? subtitle;
  bool boolvalue;
  Common_switch_tile(
      {super.key, required this.title, required this.boolvalue, this.subtitle});

  @override
  State<Common_switch_tile> createState() => _Common_switch_tileState();
}

class _Common_switch_tileState extends State<Common_switch_tile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      subtitle: widget.subtitle == null
          ? SizedBox()
          : Text(widget.subtitle.toString()),
      trailing: Switch(
          value: widget.boolvalue,
          activeColor: Appcolor.Ddarkgreen,
          inactiveThumbColor: Appcolor.lightgray,
          onChanged: (newvalue) {
            setState(() {
              widget.boolvalue = !widget.boolvalue;
            });
          }),
    );
  }
}
