import 'package:flutter/material.dart';

// ignore: must_be_immutable
class My_listTile extends StatelessWidget {
  String? title, leadingImageicon, subtitle, tralingImg, trailingText;
  Color? trailingTextCLR;
  IconData? leadingIcon;
  Function? ontap;
  My_listTile({
    super.key,
    this.title,
    this.leadingImageicon,
    this.leadingIcon,
    this.subtitle,
    this.tralingImg,
    this.ontap,
    this.trailingText,
    this.trailingTextCLR,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => ontap == null ? null : ontap!(),
      leading: leadingIcon == null
          ? leadingImageicon == null
              ? null
              : Image.asset(leadingImageicon!)
          : Icon(leadingIcon),
      title: title == null ? null : Text(title!),
      subtitle: subtitle == null ? null : Text(subtitle!),
      trailing: trailingText == null
          ? tralingImg == null
              ? null
              : Image.asset(tralingImg!)
          : Text(
              trailingText!,
              style: TextStyle(color: trailingTextCLR),
            ),
    );
  }
}
