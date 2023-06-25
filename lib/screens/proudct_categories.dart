import 'dart:convert';
import 'package:city_super_market/constants.dart';
import 'package:city_super_market/widgets/categories/categories_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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

    // fetching all categories
    get(Uri.parse(baseUrl + "/categories"))
    .then((res) {
      var response = jsonDecode(res.body);
      setState(() {
        allCategories = response['data'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CategoriesGrid(categories: allCategories);
  }
}
