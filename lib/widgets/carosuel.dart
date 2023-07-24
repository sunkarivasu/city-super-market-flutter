import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CarosuelWidget extends StatelessWidget {
  const CarosuelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: homePageBackgroundColor,
      child: CarouselSlider(
        options: CarouselOptions(height: 160.0,
            autoPlay: true,autoPlayAnimationDuration: Duration(seconds: 3)),
        items: [1,2,3].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  child: Image(image:AssetImage("images/carousel$i.jpg"))
              );
            },
          );
        }).toList(),
      ),
    );
  }
}