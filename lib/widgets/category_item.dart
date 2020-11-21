import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    Key key,
    @required this.category,
  }) : super(key: key);

  void selectCategory(BuildContext ctx) {
    /*Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => CategoryMealsScreen(
          categoryId: category.id,
          categoryTitle: category.title,
        ),
      ),
    );*/
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': category.id,
      'title': category.title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.7), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
