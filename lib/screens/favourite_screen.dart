import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
class FavouriteScreen extends StatelessWidget {
final List<Meal>favoriteMeals;
FavouriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty)
      {

        return Center(child: Text('you dont have favourite yetS'),);
      }
    return ListView.builder(itemBuilder: (context, index) {
      return MealItem(id: favoriteMeals[index].id,
        affordability: favoriteMeals[index].affordability,
        complexity: favoriteMeals[index].complexity,
        title: favoriteMeals[index].title,
        imageUrl: favoriteMeals[index].imageUrl,
        duration: favoriteMeals[index].duration,

      );
    },itemCount: favoriteMeals.length ,) ;
  }
}
