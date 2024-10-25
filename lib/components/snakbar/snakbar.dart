import 'package:flutter/material.dart';

// ignore: must_be_immutable
class My_snakbar extends StatelessWidget {
  String title;
  My_snakbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
        dismissDirection: DismissDirection.up,
        // duration: const Duration(milliseconds: 1000),
        backgroundColor: Colors.grey,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 90,
            left: 10,
            right: 10),
        behavior: SnackBarBehavior.floating,
        content: Text(title));
  }
}
