import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/chats/wallpaper/theme_screen.dart';
import 'package:whatsapp/service/app_icons&images.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

import '../../../../../../../../components/appBarWidget.dart';

class Wallpaper_screen extends StatelessWidget {
  const Wallpaper_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Theme")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.Theme,
              fit: BoxFit.cover,
              height: 0.5.sh,
              width: 0.6.sw,
            ),
            App_Service.add_Height(50),
            InkWell(
              onTap: () {
                App_Service.push_to_screen(Theme_screen(), context);
              },
              child: Text(
                'CHANGE',
                style:
                    AppTextStyle.fs16Bold.copyWith(color: Appcolor.Ddarkgreen),
              ),
            ),
            App_Service.add_Height(20),
            Text(
              'To change your wallpaper for dark theme, turn on\ndark theme from settings >Chats> Theme.',
              style: AppTextStyle.fs15Normal.copyWith(color: Appcolor.gray),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
