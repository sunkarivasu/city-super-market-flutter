import 'dart:convert';
import 'package:city_super_market/constants.dart';
import 'package:city_super_market/screens/categoryProducts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../widgets/carosuel.dart';
import '../widgets/categories/category.dart';
import '../widgets/categories/categoryItemsList.dart';
import '../widgets/categoryProducts.dart';
import '../widgets/productIcon.dart';
import '../widgets/specialOffers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> scrollableComponents = [CarosuelWidget(), SpecialOffersWidget()];

  List categories = [];
  List categoryTopItems = [];

  void appendAllComponents() {
    for (var categoryTopItem in categoryTopItems) {
      scrollableComponents.add(CategoryProductsWidgets(
          categoryName: categoryTopItem['category'],
          categoryId: categoryTopItem['categoryId'],
          categoryProducts: categoryTopItem['products']));
    }
    // scrollableComponents.add(Footer());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // print(Provider.of<User>(context).currentUser);

    //fetching all categories
    get(Uri.parse(baseUrl + "/categories")).then((res) {
      var response = jsonDecode(res.body);
      print("response:");
      print(response);
      print(response["data"]);
      setState(() {
        categories = response['data'];
      });
    });

    //fetching top 10 products from all categories
    get(Uri.parse(baseUrl + "/products/topProductsByCategory/10")).then((res) {
      var response = jsonDecode(res.body);
      print("category top items");
      print(response['data']);
      setState(() {
        categoryTopItems = response['data'];
      });
      print(categoryTopItems);
      appendAllComponents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: homePageBackgroundColor,
        child: Column(children: [
          CategoryWidget(
            categories: categories,
          ),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: scrollableComponents.length,
              itemBuilder: (BuildContext context, int index) {
                return scrollableComponents[index];
              },
            ),
          )
        ]));
  }
}
