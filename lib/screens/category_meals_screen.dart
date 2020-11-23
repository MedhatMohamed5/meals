import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
// import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> meals;
  String title;
  bool _loadedInitData = false;

  @override
  void initState() {
    // this will generate an error because of ModalRoute.of(context) isn't initialized yet
    // so we will use in didChangeDependencies

    /*
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final id = routeArgs['id'];

    title = routeArgs['title'];

    meals = DUMMY_MEALS
        .where(
          (element) => element.categories.contains(id),
        )
        .toList();*/
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // Here it will works fine because it will be called after being fully initialized
    // and still run before build method
    // but when we call setState this function will be called again and will overwrite the list again and the meal won't be deleted
    // so we will use the boolean variable

    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      final id = routeArgs['id'];

      title = routeArgs['title'];

      meals = widget.availableMeals
          .where(
            (element) => element.categories.contains(id),
          )
          .toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    /*final meals = DUMMY_MEALS
        .where(
          (element) => element.categories.contains(id),
        )
        .toList();*/

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
            // deleteItem: _deleteMeal,
          );
        },
        itemCount: meals.length,
      ),
    );
  }

  void _deleteMeal(String mealId) {
    setState(() {
      meals.removeWhere((meal) => meal.id == mealId);
    });
  }
}
