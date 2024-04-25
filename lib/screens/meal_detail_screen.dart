import 'package:flutter/material.dart';
import '../dummy_data.dart';
class MealDetailScreen extends StatelessWidget {
  
static const routeName='/meal-detail';
final Function toggle;
final Function isFav;

MealDetailScreen(this.toggle,this.isFav);
Widget buildSectionTitle(String title,BuildContext context){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Text(title,style: Theme.of(context).textTheme.titleMedium,),
  );
}
Widget buildContainer(Widget child){
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: Colors.grey)),
  height: 150,
  margin: EdgeInsets.all(10),
  padding: EdgeInsets.all(10),
  width: 320,
  child: child,
  );
}
  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context)?.settings.arguments as String ;
    final selectMeal=DUMMY_MEALS.firstWhere((meal) => meal.id ==mealId);
    return Scaffold(
      appBar: AppBar(title: Text("${selectMeal.title}"),),

      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectMeal.imageUrl,fit: BoxFit.cover,),
            ),
           buildSectionTitle('Ingredients', context),
            buildContainer(
               ListView.builder(itemCount: selectMeal.ingredients.length,
                itemBuilder:(context, index) {
                 return Card(

                    color: Theme.of(context).cardColor,
                    child:Padding(
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child: Text(selectMeal.ingredients[index],style: TextStyle(fontWeight:FontWeight.bold),)) ,
                  );
                }, ),
            ),
            buildSectionTitle('steps', context),
            buildContainer(
              ListView.builder( itemCount: selectMeal.steps.length,
              itemBuilder: (context, index) {
               return Column(
                 children: [ ListTile(
                    leading: CircleAvatar(child: Text('# ${(index+1)}'),),
                   title: Text(selectMeal.steps[index]),
                  ),
                 Divider(),
                 ],
               );
              },
              )
            )
          ],
        ),
      ) ,
      floatingActionButton: FloatingActionButton(onPressed: () {
        toggle(mealId);
      },
      child: Icon(isFav(mealId)?Icons.star:Icons.star_border),
      ),
    );


  }
}
