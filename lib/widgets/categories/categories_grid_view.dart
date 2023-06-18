import 'package:city_super_market/constants/category_tab.dart';
import 'package:city_super_market/screens/categoryProducts.dart';
import 'package:flutter/material.dart';

class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({super.key, required this.categories});

  final List<Map<String, dynamic>> categories;

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, int index) =>
            CategoryCard(categoryData: widget.categories[index]));
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryData});

  final Map<String, dynamic> categoryData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryProductsPage(
                categoryName: categoryData[categoryName])));
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Column(
            children: [
              Flexible(
                  child: Image(
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      image: NetworkImage(categoryData[categoryImage]))),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  categoryData[categoryName],
                  style: categoryTitleStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
