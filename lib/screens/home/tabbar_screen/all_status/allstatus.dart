import 'package:flutter/material.dart';
import 'package:whatsapp/service/text_styleSheet.dart';

class All_status extends StatelessWidget {
  const All_status({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Stack(alignment: Alignment.bottomRight, children: [
            Image.asset('assets/images/dp1.png'),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Appcolor.Ddarkgreen),
              child: Icon(
                Icons.add,
                color: Appcolor.black,
              ),
            )
          ]),
          title: Text('My status'),
          subtitle: Text('Tap to add status update'),
        )
      ],
    );
  }
}
