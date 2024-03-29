import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';

import '../screens/favorite_screen.dart';
import '../models/meals.dart';

class TabsScreenTopBar extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreenTopBar(this.favoriteMeals);

  _TabsScreenTopBarState createState() => _TabsScreenTopBarState();
}

class _TabsScreenTopBarState extends State<TabsScreenTopBar> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
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
      initialIndex: 0,
    );
  }
}
