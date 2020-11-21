import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  /*final String categoryId;
  final String categoryTitle;

  const CategoryMealsScreen({
    Key key,
    @required this.categoryId,
    @required this.categoryTitle,
  }) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final title = routeArgs['title'];
    final id = routeArgs['id'];

    final meals = DUMMY_MEALS
        .where(
          (element) => element.categories.contains(id),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: meals[index].id,
            title: meals[index].title,
            imageUrl: meals[index].imageUrl,
            complexity: meals[index].complexity,
            affordability: meals[index].affordability,
            duration: meals[index].duration,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
