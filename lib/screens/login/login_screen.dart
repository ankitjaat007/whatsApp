import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:whatsapp/components/button/icon_button.dart';
import 'package:whatsapp/components/textField/MytextField.dart';
import 'package:whatsapp/functions/all_function.dart';
import 'package:whatsapp/helpers/validator.dart';
import 'package:whatsapp/screens/login/otp_screen.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';
import 'package:whatsapp/utils/app_utils.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  GlobalKey<FormState> _key = GlobalKey();

  String countryName = 'India';
  String otp = "";
  int countryCode = 91;
  _showcountrypicker() {
    showCountryPicker(
      context: context,
      onSelect: (Country data) {
        setState(() {
          countryCode = int.parse(data.phoneCode);
          countryName = "${data.displayNameNoCountryCode}";
        });
      },
    );
  }

  TextEditingController numbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var data = Provider.of<AllController>(context);
    // print(numbercontroller.text);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  App_Service.add_Height(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter your phone number',
                        style: AppTextStyle.fs20Medium,
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.more_vert_sharp))
                    ],
                  ),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text:
                              'WhatsApp will need to verify your phone number.'),
                      TextSpan(
                          text: 'What’s my number?',
                          style: TextStyle(color: Appcolor.blue))
                    ]),
                    textAlign: TextAlign.center,
                  ),
                  App_Service.add_Height(40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => _showcountrypicker(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Text(countryName),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        Divider(
                          color: Appcolor.Mdarkgreen,
                        ),
                        // Expanded(
                        //     child: ListTile(
                        //   shape: UnderlineInputBorder(
                        //       borderSide:
                        //           BorderSide(color: Appcolor.Mdarkgreen)),
                        //   title: Text("+$countryCode"),
                        // )),
                        Form(
                          key: _key,
                          child: My_TextField(
                            validator: (v) => AppValidator.numberValidator(v),
                            controler: numbercontroller,
                            prefixText: '+$countryCode',
                            hintText: 'Phone Number',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('Carrier charges may apply')
                ],
              ),
            ),
            Icon_Button(
              onpressed: () {
                checkValidator();
                // otp = All_function().gerneratOtp();
              },
              width: 0.2,
              radius: 3,
              textclr: Appcolor.black,
              bgcolor: Appcolor.Mdarkgreen,
              btnName: 'NEXT',
            )
          ],
        ),
      ),
    );
  }

  checkValidator() {
    if (_key.currentState!.validate()) {
      App_utils.flushbarBarMessage(
          "otp is =>>>>>>  ${otp = All_function().gerneratOtp()}", context);
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                height: 50,
                width: 15,
                child: SpinKitCircle(
                  color: Appcolor.lightgreen,
                ),
              ),
            );
          });
      Future.delayed(
          Duration(seconds: 3),
          () => App_Service.push_to_screen(
              Otp_screen(
                number: numbercontroller.text,
                contrycod: countryCode.toString(),
                otp: otp,
              ),
              context));
    }
  }
}
