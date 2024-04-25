import 'package:flutter/material.dart';
import 'package:navigate_meals/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName='/FilterScreen';
final   Function saveFilters;
final Map<String,bool>currentFilters;
FilterScreen(this.saveFilters,this.currentFilters);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree=false;
  bool _vegetarian=false;
  bool _vegan=false;
  bool _lactoseFree=false;
  @override
  void initState() {
    // TODO: implement initState
     _glutenFree=widget.currentFilters['gluten']!;
     _vegetarian=widget.currentFilters['vegetarian']!;
     _vegan=widget.currentFilters['vegan']!;
     _lactoseFree=widget.currentFilters['lactose']!;
  }

  Widget _buildSwitchTile(String title,String des,bool currentValue, Function(bool?) updateValue){
   return SwitchListTile(value: currentValue, title: Text(title),
      subtitle: Text(des),
      onChanged: updateValue,
   );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(onPressed: () {
            final selectedFilters={
              'gluten':_glutenFree,
              'lactose':_lactoseFree,
              'vegetarian':_vegetarian,
              'vegan':_vegan,
            };
            widget.saveFilters(selectedFilters);
          }, icon: Icon(Icons.save)),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('adjust meal selection',style: Theme.of(context).textTheme.titleMedium,),
          ),
          Expanded(child: ListView(
            children: [
              _buildSwitchTile('Gluten-free', 'only include gluten', _glutenFree, (e) {
                setState(() {
                  _glutenFree=e!;
                });
              }),_buildSwitchTile('Lactose-free', 'only include Lactuse', _lactoseFree, (e) {
                setState(() {
                  _lactoseFree=e!;
                });
              }),_buildSwitchTile('Vegetarian', 'only include Vegetarian', _vegetarian, (e) {
                setState(() {
                  _vegetarian=e!;
                });
              }),_buildSwitchTile('Vegan', 'only include Vegan', _vegan, (e) {
                setState(() {
                  _vegan=e!;
                });
              })
            ],
          ),
          )
        ],
      )

    ) ;
  }
}
