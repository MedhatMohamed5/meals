import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryMealsScreen({
    Key key,
    @required this.categoryId,
    @required this.categoryTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: Center(
        child: Text('The Recipes for the category'),
      ),
    );
  }
}
