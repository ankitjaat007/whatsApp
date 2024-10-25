import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/controller/all_controller.dart';
import 'package:whatsapp/models/all_models.dart';

class All_function {
  // =====================================================================
  // =====================================================================
  // =====================================================================

  static getallchat(BuildContext context) async {
    final ab = Provider.of<AllController>(context, listen: false);
    List<ChatData_model> data = [];
    var respond = await rootBundle.loadString('assets/json/chet_data.json');
    var jsondata = jsonDecode(respond) as List;

    data = jsondata.map((e) => ChatData_model.From_model_list(e)).toList();
    ab.setallchat(data);
  }

  // =====================================================================
  // =====================================================================
  // =====================================================================

  static getallWallpaper(BuildContext context) async {
    final ab = Provider.of<AllController>(context, listen: false);
    List<Wallpaper_model> data = [];
    var respond = await rootBundle.loadString('assets/json/theme.json');
    var jsondata = jsonDecode(respond) as List;

    data = jsondata.map((e) => Wallpaper_model.FromModelList(e)).toList();
    ab.setallWallpaper(data);
  }

  // =====================================================================
  // =====================================================================
  // =====================================================================
  String gerneratOtp() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    numbers.shuffle();
    var otp = numbers.join().substring(0, 4);
    print('OTP is =====>>> $otp');
    return otp;
  }
}
