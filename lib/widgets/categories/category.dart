import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/categoryProducts.dart';
import 'categoryIcon.dart';

class CategoryWidget extends StatelessWidget {

  final categories;

  CategoryWidget({required this.categories});



  @override
  Widget build(BuildContext context) {
    return Container(
        padding:EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        height: 115,
        color: Colors.white,
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context,int index){
            print(categories[index]['categoryName']);
            return CategoryIcon(name: categories[index]['categoryName'], categoryId:categories[index]['_id'],image: categories[index]['categoryImage']);
          },
          scrollDirection: Axis.horizontal,

        )
    );
  }
}

