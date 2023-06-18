import 'package:city_super_market/constants/mock_data.dart';
import 'package:city_super_market/widgets/categories/categories_grid_view.dart';
import 'package:flutter/material.dart';

class ProductCategories extends StatefulWidget {
  const ProductCategories({super.key});

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  List<Map<String, dynamic>> allCategories = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      allCategories = mockCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CategoriesGrid(categories: allCategories);
  }
}
