import 'package:flutter/material.dart';
import 'package:navigate_meals/widgets/meal_item.dart';

import '../models/meal.dart';
class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;
  //
  //  CategoryMealsScreen(this.categoryId,this.categoryTitle);
static const route="/category-meals";
final List<Meal> availableMeals;
CategoryMealsScreen(this.availableMeals);
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
    // @override
    late String categoryTitle;
    late List<Meal>displayedMeals;
  void initState() {
    // TODO: implement initState
    //   final routArgs=ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    //   final categoryTitle=routArgs["title"];
    //   final categoryId=routArgs["id"];
    //   final displayedMeals=DUMMY_MEALS.where((meal) {
    //     return meal.categories.contains(categoryId);
    //   }).toList();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement
    final routArgs=ModalRoute.of(context)!.settings.arguments as Map<String,String>;
     categoryTitle=routArgs["title"]!;
    final categoryId=routArgs["id"];
     displayedMeals=widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((element) => element.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryTitle"),
        // backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return MealItem(id: displayedMeals[index].id,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,

        );
      },itemCount:displayedMeals.length ,)
    );
  }
}
