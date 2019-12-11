import 'package:flutter/material.dart';
import '../screens/favorite_screen.dart';
import '../screens/categories_screen.dart';
import '../widgets/main_drawer.dart';

class TabScreenBottomBar extends StatefulWidget {
  const TabScreenBottomBar({Key key}) : super(key: key);

  @override
  _TabScreenBottomBarState createState() => _TabScreenBottomBarState();
}

class _TabScreenBottomBarState extends State<TabScreenBottomBar> {
  int _selectedPageIndex = 0;

  final List<Map<String, Object>> pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(), 'title': 'Favorites'}
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              title: Text("Meals"), icon: Icon(Icons.category)),
          BottomNavigationBarItem(
              title: Text("Favorites"), icon: Icon(Icons.star)),
        ],
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 24,
        backgroundColor: Theme.of(context).accentColor,
        selectedFontSize: 16,
        unselectedFontSize: 13,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
