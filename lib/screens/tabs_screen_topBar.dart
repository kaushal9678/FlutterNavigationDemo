import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../models/meals.dart';
import '../screens/favorite_screen.dart';

class TabsScreenTopBar extends StatefulWidget {
  //TabsScreenTopBar({Key key}) : super(key: key);
  final List<Meal> favoriteMeals;
  TabsScreenTopBar(this.favoriteMeals);
  _TabsScreenTopBarState createState() => _TabsScreenTopBarState();
}

class _TabsScreenTopBarState extends State<TabsScreenTopBar> {
  List<Map<String, Object>> pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(
            onTap: _selectPage,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorites',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoriteScreen(widget.favoriteMeals)
          ],
        ),
      ),
      initialIndex: _selectedPageIndex,
    );
  }
}
