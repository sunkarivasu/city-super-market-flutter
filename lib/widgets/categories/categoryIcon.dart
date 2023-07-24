import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/categoryProducts.dart';

class CategoryIcon extends StatelessWidget {

  String name;
  String categoryId;
  String image;

  CategoryIcon({required this.name,required this.categoryId, required this.image});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      Navigator.push(context,MaterialPageRoute(builder: (context) => CategoryProductsPage(categoryName: name, categoryId: categoryId)));
    }, child: Column(
      children: [
        Image(image: NetworkImage(image),
          width: 65,
          height: 70,),
        Text(name,style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 14
        ),)
      ],

    ),);

  }
}