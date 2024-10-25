import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/components/appBarWidget.dart';
import 'package:whatsapp/controller/all_controller.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/setting/chats/wallpaper/allTheme.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Theme_screen extends StatelessWidget {
  const Theme_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var a = Provider.of<AllController>(context);
    var wallpaper_data = a.getallWallpaper;

    return Scaffold(
      appBar: CustomAppBar(title: Text('Light Theme wallpaper')),
      body: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            // padding: EdgeInsets.all(20),
            itemCount: wallpaper_data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 2, childAspectRatio: 0.9),
            itemBuilder: (context, index) => Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    App_Service.push_to_screen(
                        All_Theme_screen(model: wallpaper_data[index]),
                        context);
                  },
                  child: Image.asset(
                    wallpaper_data[index].image[0],
                    width: 280.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'data',
                  style: AppTextStyle.fs18Bold,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
