
import 'package:flutter/cupertino.dart';

import '../productIcon.dart';

class CategoryItemsList extends StatelessWidget {
  List categoryProducts;


  CategoryItemsList({required this.categoryProducts});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryProducts.length,
        itemBuilder: (BuildContext context, int index){
          // hardcoded few fields for now need to be changed once the api end point is fixed.
          return ProductIconWidget(
              id:categoryProducts[index]['_id'],
              image: categoryProducts[index]['image'],
              name: categoryProducts[index]['name'],
              variants: categoryProducts[index]['variants'],
              quantityType: categoryProducts[index]['quantityType'],
              description: categoryProducts[index]['description']);

        },
      ),
    );
  }
}