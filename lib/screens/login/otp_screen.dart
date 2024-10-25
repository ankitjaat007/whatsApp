import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whatsapp/components/button/icon_button.dart';
import 'package:whatsapp/functions/all_function.dart';
import 'package:whatsapp/helpers/validator.dart';
import 'package:whatsapp/screens/home/tabBar_screen.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

import '../../utils/app_utils.dart';

// ignore: must_be_immutable
class Otp_screen extends StatefulWidget {
  String contrycod, number, otp;

  Otp_screen(
      {super.key,
      required this.contrycod,
      required this.number,
      required this.otp});

  @override
  State<Otp_screen> createState() => _Otp_screenState();
}

class _Otp_screenState extends State<Otp_screen> {
  GlobalKey<FormState> _key = GlobalKey();
  int time = 60;
  int timeresend = 50;
  @override
  void initState() {
    getTime();
    super.initState();
  }

  TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final modeldata = Provider.of<AllController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP Code'),
        foregroundColor: Appcolor.black,
        elevation: 0,
        backgroundColor: Appcolor.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Center(
            child: Column(
              children: [
                Text(
                    'Code has been send to +${widget.contrycod} ${widget.number}'),
                App_Service.add_Height(30),
                Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: PinCodeTextField(
                      validator: (value) => AppValidator.otpValidator(value),
                      controller: otpcontroller,
                      // obscureText: true,
                      showCursor: false,
                      autoFocus: true,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      enableActiveFill: true,
                      appContext: context,
                      length: 4,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(15),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeColor: Appcolor.black,
                          activeFillColor: Colors.transparent,
                          selectedColor: Appcolor.black,
                          selectedFillColor: Colors.transparent,
                          inactiveColor: Appcolor.black,
                          inactiveFillColor: Appcolor.white),
                    ),
                  ),
                ),
                App_Service.add_Height(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Resend Code in'),
                    time == 0
                        ? TextButton(
                            onPressed: () {
                              time = timeresend;
                              setState(() {});
                              getTime();
                              widget.otp = All_function().gerneratOtp();
                            },
                            child: Text('resend'))
                        : Text.rich(TextSpan(children: [
                            TextSpan(
                                text: " $time",
                                style: TextStyle(color: Appcolor.Ddarkgreen)),
                            TextSpan(text: ' s')
                          ]))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Icon_Button(
              onpressed: () {
                checkValidator();
              },
              radius: 20,
              btnName: 'Verify',
              textclr: Appcolor.white,
              bgcolor: Appcolor.black,
            ),
          ),
        ],
      ),
    );
  }

  getTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        time = time - 1;
        setState(() {});
      } else {
        timer.cancel();
        // setState(() {});
        print("otp time out ");
      }
    });
  }

  // ===========================
  checkValidator() {
    if (_key.currentState!.validate()) {
      final data = widget.otp == otpcontroller.text;
      if (data) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Container(
              height: 50,
              width: 15,
              child: SpinKitCircle(
                color: Appcolor.lightgreen,
              ),
            ),
          ),
        );
        Future.delayed(
          Duration(seconds: 2),
          () {
            App_Service.push_and_replace(tabBar_screen(), context);
          },
        );
      } else {
        App_utils.flushbarBarMessage('woung otp', context);
      }
    }
  }
}
