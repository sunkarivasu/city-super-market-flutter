import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/categoryProducts.dart';
import 'categories/categoryItemsList.dart';

class CategoryProductsWidgets extends StatelessWidget {

  List categoryProducts;
  String categoryId;
  String categoryName;
  CategoryProductsWidgets({required this.categoryProducts, required this.categoryId, required this.categoryName});



  @override
  Widget build(BuildContext context) {

    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color(0xffeeeeee),
                blurRadius: 2.0),
          ]
      ),
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(categoryName,style:
                TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black
                )),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProductsPage(categoryName: categoryName, categoryId: categoryId,)));
                }, child: Text("VIEW ALL"),
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xff172437),
                      primary: Colors.white,
                      padding: EdgeInsets.all(11)
                  ),)
              ],
            ),
          ),
          SizedBox(height:1,
            child: Container(
              color: Color(0xffeeeeee),
            ),),
          CategoryItemsList(categoryProducts:categoryProducts),
        ],
      ),
    );
  }
}
