import 'package:flutter/material.dart';

import '../service/text_styleSheet.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({required super.title});

  @override
  Color? get backgroundColor => Appcolor.Ddarkgreen;

  @override
  TextStyle? get titleTextStyle => AppTextStyle.fs20Medium;

  @override
  Color? get foregroundColor => Appcolor.white;
}
// class appbarWidget {
//   static PreferredSizeWidget myAppBar(title) {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: clr.darkgrey,
//       foregroundColor: clr.white,
//       title: Text(
//         title,
//         style: Mystyle.fs20_bold,
//       ),
//       toolbarHeight: 60,
//     );
//   }
// }