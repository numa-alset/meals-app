import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favourite_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';
class TabsScreen extends StatefulWidget {
  final List<Meal>favoriteMeals;
TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


 late List<Map<String,Object>>_page ;
@override
  void initState() {
    // TODO: implement initState
  _page=[
    {'page':CategoriesScreen(),'title':'Category'},
    {'page':FavouriteScreen(widget.favoriteMeals),'title':'Your Favourite'}];
    super.initState();
  }
int _selectedPageIndex=0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(length: 2,initialIndex: 0,animationDuration: Duration(seconds: 1), child: Scaffold(
    //   appBar: AppBar(
    //     title: Text('Meals'),
    //     bottom: TabBar(tabs: [
    //       Tab(icon: Icon(Icons.category),text:'categories' ,),
    //       Tab(icon: Icon(Icons.star),text: 'Favourite',),
    //     ]),
    //   ),
    //   body: TabBarView(
    //
    //       children: [
    //     CategoriesScreen(),FavouriteScreen(),
    //   ]),
    // )
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectedPageIndex]['title']as String),
      ),
      drawer: MainDrawer(),
      body: _page[_selectedPageIndex]['page']as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap:_selectPage ,

        items: [BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Categories',backgroundColor: Theme.of(context).primaryColor,),
        BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favourite',backgroundColor: Theme.of(context).primaryColor,)
        ],
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellowAccent,
        currentIndex: _selectedPageIndex,
      type: BottomNavigationBarType.fixed,

      ),
    );
  }
}
