import 'package:flutter/material.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

// ignore: must_be_immutable
class Icon_Button extends StatelessWidget {
  String? btnName, iconimages;
  Color? textclr, bgcolor, borderclr, imagecolor;
  Function? onpressed;
  double? radius, width;
  IconData? icons;

  Icon_Button({
    super.key,
    this.btnName,
    this.onpressed,
    this.textclr,
    this.bgcolor,
    this.iconimages,
    this.borderclr,
    this.imagecolor,
    this.radius,
    this.width,
    this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () => onpressed == null ? null : onpressed!(),
        icon: icons == null
            ? iconimages == null
                ? SizedBox()
                : Image.asset(
                    iconimages!,
                    color: imagecolor,
                  )
            : Icon(
                icons,
                color: Appcolor.black,
              ),
        label: btnName == null
            ? SizedBox()
            : Text(
                btnName!,
                style: TextStyle(color: textclr),
              ),
        style: TextButton.styleFrom(
            backgroundColor: bgcolor,
            minimumSize: Size(
                width == null
                    ? App_Service.getscreenheight(context)
                    : App_Service.getscreenwidth(context) * width as double,
                35),
            shape: RoundedRectangleBorder(
                borderRadius: radius == null
                    ? BorderRadius.zero
                    : BorderRadius.circular(radius as double)),
            side: borderclr == null
                ? BorderSide.none
                : BorderSide(color: borderclr!)));
  }
}
