import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';

import '../screens/favorite_screen.dart';

class TabsScreenTopBar extends StatefulWidget {
  TabsScreenTopBar({Key key}) : super(key: key);

  _TabsScreenTopBarState createState() => _TabsScreenTopBarState();
}

class _TabsScreenTopBarState extends State<TabsScreenTopBar> {
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
          children: <Widget>[CategoriesScreen(), FavoriteScreen()],
        ),
      ),
      initialIndex: 0,
    );
  }
}
