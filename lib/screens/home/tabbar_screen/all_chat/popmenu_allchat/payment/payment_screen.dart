import 'package:flutter/material.dart';
import 'package:whatsapp/components/button/icon_button.dart';
import 'package:whatsapp/components/listTile/listTile.dart';
import 'package:whatsapp/screens/home/tabbar_screen/all_chat/popmenu_allchat/payment/newpayment.dart';
import 'package:whatsapp/service/app_icons&images.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class Payment_screen extends StatelessWidget {
  const Payment_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD9D9D9),
      appBar: AppBar(
        backgroundColor: Appcolor.Ddarkgreen,
        title: Text('Payments'),
        titleTextStyle: AppTextStyle.fs20Medium,
        foregroundColor: Appcolor.white,
      ),
      body: Column(
        children: [
          Container(
            color: Appcolor.white,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'History',
                  style: TextStyle(color: Appcolor.Ddarkgreen, fontSize: 18),
                ),
                App_Service.add_Height(10),
                Center(
                  child: Column(
                    children: [
                      Image.asset(AppIcons.history),
                      App_Service.add_Height(10),
                      Text(
                        'No payment history',
                        style: TextStyle(color: Appcolor.gray),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          App_Service.add_Height(10),
          Container(
            color: Appcolor.white,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment method',
                  style: TextStyle(color: Appcolor.Ddarkgreen, fontSize: 18),
                ),
                App_Service.add_Height(10),
                ListTile(
                  leading: Image.asset(AppIcons.lock),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'To protect your security. WhatsApp does not store your upi pin or full bank account number.'),
                      Text(
                        'Learn more',
                        style: TextStyle(color: Appcolor.blue),
                      )
                    ],
                  ),
                ),
                My_listTile(
                  leadingImageicon: AppIcons.add,
                  title: 'Add payment method',
                )
              ],
            ),
          ),
          App_Service.add_Height(10),
          Expanded(
            child: Container(
              color: Appcolor.white,
              padding: EdgeInsets.all(10),
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  My_listTile(
                    leadingImageicon: AppIcons.help,
                    title: 'Help',
                  ),
                  App_Service.add_Height(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppIcons.bhim),
                      App_Service.add_Width(10),
                      Image.asset(AppIcons.upi),
                    ],
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon_Button(
                      onpressed: () {
                        App_Service.push_and_replace(
                            New_payment_screen(), context);
                      },
                      iconimages: AppIcons.rupya,
                      btnName: 'NEW PAYMENT',
                      bgcolor: Appcolor.Ddarkgreen,
                      width: 0.1,
                      textclr: Appcolor.white,
                      radius: 30,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
