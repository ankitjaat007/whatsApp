import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/components/appBarWidget.dart';
import 'package:whatsapp/functions/image_piker.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({super.key});

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text('Profile')),
      body: Column(children: [
        Gap(15.h),
        Center(
            child: InkWell(
          // onTap: () async {
          //   String image = await getImageFormGallery(context);
          //   image.isNotEmpty ? profileImage = File(image) : null;
          //   setState(() {});
          // },
          child: Stack(alignment: Alignment.bottomRight, children: [
            profileImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image.file(
                      profileImage!,
                      height: 120.sp,
                      width: 120.sp,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset('assets/images/profile0.2.png'),
            CircleAvatar(
                foregroundColor: Appcolor.white,
                backgroundColor: Appcolor.Ddarkgreen,
                child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        context: context,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Profile photo',
                                    style: AppTextStyle.fs18Bold,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        App_Service.pop_screen(context);
                                      },
                                      icon: Icon(Icons
                                          .keyboard_double_arrow_down_sharp))
                                ],
                              ),
                              Gap(20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      String image =
                                          await getImageFormCamra(context);
                                      // image.isNotEmpty
                                      //     ?
                                      profileImage = File(image);
                                      // : null;
                                      setState(() {});
                                      App_Service.pop_screen(context);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Appcolor.lightgray)),
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Appcolor.Ddarkgreen,
                                            )),
                                        Text('Camera')
                                      ],
                                    ),
                                  ),
                                  // Gap(20),
                                  InkWell(
                                    onTap: () async {
                                      String image =
                                          await getImageFormGallery(context);
                                      // image.isNotEmpty
                                      //     ?
                                      profileImage = File(image);
                                      // : null;
                                      setState(() {});

                                      App_Service.pop_screen(context);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Appcolor.lightgray)),
                                            child: Icon(
                                              Icons.photo,
                                              color: Appcolor.Ddarkgreen,
                                            )),
                                        Text('gallery')
                                      ],
                                    ),
                                  ),
                                  // Gap(20),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        profileImage = null;
                                      });
                                      App_Service.pop_screen(context);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Appcolor.lightgray)),
                                            child: Icon(
                                              Icons.cancel,
                                              color: Appcolor.Ddarkgreen,
                                            )),
                                        Text('delete photo')
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.camera_alt)))
          ]),
        )),
        Gap(50.h),
        ListTile(
          leading: Icon(Icons.person_rounded),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(color: Appcolor.lightgray),
              ),
              Text('Susi Franklin'),
              Gap(10.h),
            ],
          ),
          subtitle: Text(
              'This is not your username or pin. This name will be visible to your whatsApp contacts.'),
          trailing: Icon(
            Icons.edit,
            color: Appcolor.Ddarkgreen,
          ),
        ),
        Divider(
          thickness: 0.5,
          color: Appcolor.lightbrown,
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About',
                style: TextStyle(color: Appcolor.lightgray),
              ),
              Text('Hey there! I am using whatsApp.'),
            ],
          ),
          trailing: Icon(
            Icons.edit,
            color: Appcolor.Ddarkgreen,
          ),
        ),
        Divider(
          thickness: 0.5,
          color: Appcolor.lightbrown,
        ),
        ListTile(
          leading: Icon(Icons.call),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone',
                style: TextStyle(color: Appcolor.lightgray),
              ),
              Text('+91 1234567890'),
            ],
          ),
          trailing: Icon(
            Icons.edit,
            color: Appcolor.Ddarkgreen,
          ),
        )
      ]),
    );
  }
}
