import 'package:flutter/material.dart';
import 'package:whatsapp/service/app_services.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

// ==============================
// single select dialog
// --

// ignore: must_be_immutable
class My_dialog_singleSelect extends StatefulWidget {
  String? dialogTital, dialogSubtitle;
  List<String> data;
  var selected;
  bool buttonshow;
  final Function(String) onDone;
  My_dialog_singleSelect(
      {super.key,
      this.dialogTital,
      this.dialogSubtitle,
      required this.selected,
      required this.data,
      required this.onDone,
      this.buttonshow = false});

  @override
  State<My_dialog_singleSelect> createState() => _My_dialog_singleSelectState();
}

class _My_dialog_singleSelectState extends State<My_dialog_singleSelect> {
  var colour = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      colour = widget.selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Appcolor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.dialogTital == null
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    widget.dialogTital.toString(),
                    style: AppTextStyle.fs18Bold,
                  ),
                ),
          widget.dialogSubtitle == null
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    widget.dialogSubtitle.toString(),
                    style: AppTextStyle.fs15Normal
                        .copyWith(color: Appcolor.lightgray),
                  ),
                ),
          ...List.generate(
              widget.data.length,
              (index) => ListTile(
                    onTap: () {
                      setState(() {
                        colour = widget.data[index].toString();

                        widget.buttonshow == false
                            ? (
                                widget.onDone(colour),
                                App_Service.pop_screen(context)
                              )
                            : null;
                      });
                    },
                    leading: Radio(
                      activeColor: Appcolor.Mdarkgreen,
                      value: widget.data[index].toString(),
                      groupValue: colour,
                      onChanged: (value) {
                        setState(() {
                          colour = value.toString();
                          widget.buttonshow == false
                              ? (
                                  widget.onDone(value.toString()),
                                  App_Service.pop_screen(context)
                                )
                              : null;
                        });
                      },
                    ),
                    title: Text(widget.data[index]),
                  )),
          widget.buttonshow == false
              ? SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          App_Service.pop_screen(context);
                        },
                        child: Text(
                          "CANCEL",
                          style: TextStyle(color: Appcolor.Mdarkgreen),
                        )),
                    TextButton(
                        onPressed: () {
                          widget.onDone(colour);
                          App_Service.pop_screen(context);
                        },
                        child: Text(
                          "OK",
                          style: TextStyle(color: Appcolor.Mdarkgreen),
                        ))
                  ],
                )
        ],
      ),
    );
  }
}

// ==============================
// multipal select dialog
// --
// ignore: must_be_immutable
class My_dialog_multipalSelect extends StatefulWidget {
  String? dialogTital, subtitle, donebutton;
  List<String> data;
  String selected;
  // List? select;
  TextStyle? style;
  final Function(String)? onDone;
  My_dialog_multipalSelect({
    super.key,
    this.dialogTital,
    // this.select = const [],
    this.subtitle,
    this.style,
    this.selected = '',
    required this.donebutton,
    this.data = const [],
    this.onDone,
  });

  @override
  State<My_dialog_multipalSelect> createState() =>
      _My_dialog_multipalSelectState();
}

class _My_dialog_multipalSelectState extends State<My_dialog_multipalSelect> {
  var colour2 = [];

  @override
  void initState() {
    super.initState();
    widget.selected.isNotEmpty || widget.selected == "No Media"
        ? setState(() => colour2 = widget.selected == "All Media"
            ? colour2 = widget.data
            : widget.selected.split(", "))
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Appcolor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.dialogTital == null
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    widget.dialogTital.toString(),
                    style: widget.style == null
                        ? AppTextStyle.fs18Bold
                        : widget.style,
                  ),
                ),
          widget.subtitle == null
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    widget.subtitle.toString(),
                    style: TextStyle(color: Appcolor.gray),
                  ),
                ),
          ...List.generate(
              widget.data.length,
              (index) => ListTile(
                    onTap: () {
                      setState(() {
                        if (colour2.contains(widget.data[index].toString())) {
                          colour2.remove(widget.data[index].toString());
                        } else {
                          colour2.add(widget.data[index].toString());
                        }
                      });
                    },
                    leading: Checkbox(
                        activeColor: Appcolor.Ddarkgreen,
                        onChanged: (isSelected) {
                          setState(() {
                            if (isSelected!) {
                              colour2.add(widget.data[index]);
                            } else {
                              colour2.remove(widget.data[index]);
                            }
                          });
                        },
                        value: colour2.contains(widget.data[index])),

                    //     Radio(
                    //   activeColor: Appcolor.Mdarkgreen,
                    //   value: widget.data[index],
                    //   groupValue: colour2.firstWhere(
                    //       (element) => element == widget.data[index].toString(),
                    //       orElse: () => null),
                    //   onChanged: (value) {
                    //     setState(() {
                    //       if (colour2.contains(value.toString())) {
                    //         colour2.remove(value.toString());
                    //       } else {
                    //         colour2.add(value.toString());
                    //       }
                    //     });
                    //     // setState(() {
                    //     //   colour2 = value.toString();
                    //     // });
                    //   },
                    // ),
                    title: Text(widget.data[index]),
                  )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    App_Service.pop_screen(context);
                  },
                  child: Text(
                    "CANCEL",
                    style: TextStyle(color: Appcolor.Mdarkgreen),
                  )),
              TextButton(
                  onPressed: () {
                    widget.onDone == null
                        ? (null, App_Service.pop_screen(context))
                        : (
                            widget.onDone!(colour2.length == widget.data.length
                                ? "All Media"
                                : colour2.join(", ")),
                            App_Service.pop_screen(context)
                          );
                  },
                  child: Text(
                    widget.donebutton!,
                    style: TextStyle(color: Appcolor.Mdarkgreen),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
