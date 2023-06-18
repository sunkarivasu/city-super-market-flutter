import 'dart:convert';

import 'package:city_super_market/constants/mock_data.dart';
import 'package:city_super_market/widgets/categories/categories_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../constants.dart';

class ProductCategories extends StatefulWidget {
  const ProductCategories({super.key});

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  List<dynamic> allCategories = [];

  @override
  void initState() {
    super.initState();
    get(Uri.https(authority, "categories"))
        .then((res)
    {
      var response = jsonDecode(res.body);
      print(response);
      setState((){
        allCategories = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CategoriesGrid(categories: allCategories);
  }
}
