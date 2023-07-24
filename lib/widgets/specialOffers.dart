import 'dart:convert';

import 'package:city_super_market/constants.dart';
import 'package:city_super_market/widgets/productIcon.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../screens/categoryProducts.dart';
import '../staticData/categoryProducts.dart';

class SpecialOffersWidget extends StatefulWidget {
  const SpecialOffersWidget({Key? key}) : super(key: key);

  @override
  State<SpecialOffersWidget> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffersWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var specialOffers = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    // fetching special offers
    get(Uri.parse(baseUrl + "/normalOffers")).then((res) {
      var response = jsonDecode(res.body);
      print(response);
      setState(() {
        specialOffers = response['data'];
      });
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Color(0xffeeeeee), blurRadius: 2.0),
        ]),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Special Offers", style: categoryNameStyle),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProductsPage(isSpecialOffer: true,categoryName: '', categoryId: '',)));
                      // print("navigating");
                    },
                    child: Text("VIEW ALL"),
                    style: viewAllButtonStyle)
              ],
            ),
          ),
          SizedBox(
            height: 1,
            child: Container(
              color: Color(0xffeeeeee),
            ),
          ),
          Container(
            height: 225,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: specialOffers.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductIconWidget(
                    id: specialOffers[index]['_id'],
                    image: specialOffers[index]['image'],
                    name: specialOffers[index]['name'],
                    variants: specialOffers[index]['variants'],
                    quantityType: specialOffers[index]['quantityType'],
                    description: specialOffers[index]['description']);
              },
            ),
          )
        ]));
  }
}
