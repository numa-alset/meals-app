import 'package:flutter/material.dart';
import '../screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
 final String title;
 final String id;
 final Color color;
 CategoryItem(this.id,this.title,this.color);

 void selectCategory(BuildContext context){
   Navigator.of(context).pushNamed('/category-meals',arguments:{"id":id,"title":title} );
   }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
       selectCategory(context); 
      } ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.titleSmall,),
        decoration: BoxDecoration(gradient: LinearGradient(colors:[color.withOpacity(0.7),color,],begin: Alignment.topLeft,end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
