import 'package:flutter/material.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

// ignore: must_be_immutable
class My_TextField extends StatelessWidget {
  String? hintText, prefixText;
  IconData? prefixIcon;
  Function? onpressed;
  TextEditingController? controler;
  Function(String)? validator;

  My_TextField(
      {super.key,
      this.hintText,
      this.prefixText,
      this.controler,
      this.prefixIcon,
      this.onpressed,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      validator: validator == null ? null : (value) => validator!(value!),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          prefixIcon: prefixText == null
              ? prefixIcon == null
                  ? SizedBox()
                  : Icon(prefixIcon, color: Color.fromRGBO(0, 0, 0, 0.5))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(prefixText.toString()),
                  ],
                ),
          hintText: hintText,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Appcolor.Mdarkgreen)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Appcolor.Mdarkgreen))),
    );
  }
}
