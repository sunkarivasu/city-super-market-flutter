import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../arguments.dart';
import '../constants.dart';

class ProductIconWidget extends StatelessWidget {

  String id;
  String image;
  String name;
  List variants;
  String quantityType;
  String description;


  ProductIconWidget({required this.id,required this.image,required this.name,required this.variants,required this.quantityType,required this.description});

  @override
  Widget build(BuildContext context) {

    print("discount");

    return TextButton(onPressed: (){
      Navigator.pushNamed(context,"/productDetails",
        arguments:ProductDetailsArguments(productId:id,image: image, brand: name, variants: variants, quantityType:quantityType, description: description),
      );
    },
        child: Container(
          // width: 115,
          // height: 200,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color(0xffeeeeee),
                    width: 1
                )
            ),
            padding:EdgeInsets.all(5),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image(image:NetworkImage(image),width: 120,height: 120,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5,),
                      Text(name,
                        style: kIconBrandNameTextStyle,),
                      SizedBox(height: 5,),
                      Text("₹ "+variants[0]['price'].toString(),style: kIconActualPriceTextStyle,),
                      // Row(
                      //   children: [
                      //     Text("₹ ${actualPrice.toInt()}",style: kIconActualPriceTextStyle,),
                      //     Padding(
                      //       padding: const EdgeInsets.only(left:10),
                      //       child: Text("₹ $mrp",
                      //       style: kIconDiscountTextStyle,),
                      //     )
                      //   ],
                      // ),
                      SizedBox(height: 5,),
                      Text(description,
                        style: kIconDescriptionTextStyle,),
                      SizedBox(height: 5,),
                    ],
                  ),
                )
              ],
            )
        ));
  }
}