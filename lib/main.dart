import 'dart:developer';

import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'package:navigate_meals/screens/filters_screen.dart';
import 'screens/category_meals.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screens.dart';
import 'screens/categories_screen.dart';
import './models/meal.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegetarian':false,
    'vegan':false,
  };
  List<Meal>_availableMeals=DUMMY_MEALS;
  List<Meal>_favoriteMeals=[];
  void _setFilters(Map<String,bool> filterData){
 setState(() {
   _filters=filterData;
   _availableMeals=DUMMY_MEALS.where((meal) {
    if(_filters['gluten']!&&!meal.isGlutenFree){
      return false;
    }if(_filters['lactose']! &&!meal.isLactoseFree){
      return false;
    }if(_filters['vegetarian']!&&!meal.isVegetarian){
      return false;
    }if(_filters['vegan']!&&!meal.isVegan){
      return false;
    }
    return true;
   }).toList();
 });
  }
  void _toggleFavorite(String mealId){
   final existingIndex=_favoriteMeals.indexWhere((meal) =>meal.id==mealId);
   if(existingIndex>=0){
     setState(() {
       _favoriteMeals.removeAt(existingIndex);
     });
   }
   else{
     setState(() {
       _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));
     });
   }
  }
bool _isMealFav(String id){
    return _favoriteMeals.any((element) => element.id==id);

}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink,onSecondary: Colors.amber,background: Colors.amberAccent[100],),
        primarySwatch: Colors.pink,
        appBarTheme: AppBarTheme(
        color: Colors.pink,
        titleTextStyle: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
          fontSize: 20,
          fontFamily: 'RobotoConensed',
          fontWeight: FontWeight.bold,
        ),
      ),

        // primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        useMaterial3: true,
        fontFamily: 'Raleway',
         dialogTheme: DialogTheme(titleTextStyle: TextStyle(fontSize: 20,
           fontFamily: 'RobotoConensed',
           fontWeight: FontWeight.bold,),contentTextStyle: TextStyle(fontSize: 20,
           fontFamily: 'RobotoConensed',
           fontWeight: FontWeight.bold,),),

         textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge :TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyMedium :TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodySmall:TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          titleLarge: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoConensed',
            fontWeight: FontWeight.bold,
          ),titleMedium: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoConensed',
          fontWeight: FontWeight.bold,
          ),titleSmall: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoConensed',
            fontWeight: FontWeight.bold,
          ),



         ),
      ),
      // home:  CategoriesScreen(),
      initialRoute: '/',
      routes: {
        "/":(context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.route:(context) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName:(context)=>MealDetailScreen(_toggleFavorite,_isMealFav),
        FilterScreen.routeName:(context) => FilterScreen(_setFilters,_filters),

      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen(),);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('Meals app'),
      ),
      body: Center(
          child: const Text('You have pushed the button this many times:'),
      ),
    );
  }
}
