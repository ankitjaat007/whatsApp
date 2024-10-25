import 'package:flutter/material.dart';
import 'package:whatsapp/models/all_models.dart';

// ignore: must_be_immutable
class All_Theme_screen extends StatelessWidget {
  Wallpaper_model model;
  All_Theme_screen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          itemCount: model.image.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 2, childAspectRatio: 1.15),
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                model.image[index],
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
