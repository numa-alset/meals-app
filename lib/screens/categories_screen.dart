import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent:200,childAspectRatio: 4/3,crossAxisSpacing: 18,mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES.map((e) {return CategoryItem(e.id,e.title,e.color );}).toList(),
      );

  }
}
