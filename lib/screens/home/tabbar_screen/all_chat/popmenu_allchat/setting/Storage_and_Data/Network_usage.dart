import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/components/dialog/my_dialog.dart';
import 'package:whatsapp/models/dummydata.dart';

import '../../../../../../../components/appBarWidget.dart';
import '../../../../../../../service/text_styleSheet.dart';

class Network_usage_screen extends StatelessWidget {
  const Network_usage_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Network usage")),
      body: Column(
        children: [
          ListTile(
            leading: SizedBox(),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text('Usage'),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(text: '78', style: AppTextStyle.fs35Medium),
                  TextSpan(text: ' MB', style: AppTextStyle.fs20Medium),
                ])),
                Gap(10.h),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward_outlined,
                              size: 20,
                            ),
                            Text(' Sent'),
                          ],
                        ),
                        Text(
                          '6.1 MB',
                          style: AppTextStyle.fs15Normal
                              .copyWith(color: Appcolor.black),
                        )
                      ],
                    ),
                    Gap(45.w),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_downward_outlined,
                              size: 20,
                            ),
                            Text(' Received'),
                          ],
                        ),
                        Text(
                          '69.2 MB',
                          style: AppTextStyle.fs15Normal
                              .copyWith(color: Appcolor.black),
                        )
                      ],
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
              ],
            ),
          ),
          Gap(20.h),
          ...List.generate(
              Dummydata().Network_useage_detals.length,
              (index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10).copyWith(
                      bottom: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Dummydata().Network_useage_detals[index]['icon'],
                          color: Appcolor.lightgray,
                          size: 30,
                        ),
                        Gap(10.w),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Dummydata().Network_useage_detals[index]
                                        ['title'],
                                    style: AppTextStyle.fs16Bold,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_upward_outlined,
                                        size: 20,
                                        color: Appcolor.lightgray,
                                      ),
                                      Text(
                                        Dummydata().Network_useage_detals[index]
                                            ['send'],
                                        style: TextStyle(
                                            color: Appcolor.lightgray),
                                      ),
                                      Gap(10.w),
                                      Icon(
                                        Icons.arrow_downward_outlined,
                                        color: Appcolor.lightgray,
                                        size: 20,
                                      ),
                                      Text(
                                          Dummydata()
                                                  .Network_useage_detals[index]
                                              ['received'],
                                          style: TextStyle(
                                              color: Appcolor.lightgray)),
                                    ],
                                  )
                                ],
                              ),
                              Gap(2.h),
                              LinearProgressIndicator(
                                backgroundColor: Appcolor.lightgray,
                                borderRadius: BorderRadius.circular(10),
                                minHeight: 4,
                                value: Dummydata().Network_useage_detals[index]
                                    ['fill_stroge'],
                                valueColor:
                                    AlwaysStoppedAnimation(Appcolor.Ddarkgreen),
                              ),
                              Gap(2.h),
                              Row(
                                children: [
                                  Text(
                                    Dummydata().Network_useage_detals[index]
                                        ['msg_1'],
                                    style: TextStyle(color: Appcolor.lightgray),
                                  ),
                                  Dummydata().Network_useage_detals[index]
                                              ['msg_2'] ==
                                          ''
                                      ? SizedBox()
                                      : Text(
                                          ".${Dummydata().Network_useage_detals[index]['msg_2']}",
                                          style: TextStyle(
                                              color: Appcolor.lightgray)),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
          Divider(
            thickness: 1,
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => My_dialog_multipalSelect(
                    style: AppTextStyle.fs15Normal,
                    dialogTital: 'Reset network usage statistics?',
                    donebutton: 'RESET'),
              );
            },
            leading: SizedBox(),
            title: Text(
              'REset statistics',
              style: AppTextStyle.fs16Bold,
            ),
            subtitle: Text('Last reset time: Never'),
          )
        ],
      ),
    );
  }
}
