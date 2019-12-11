import 'package:flutter/material.dart';
import '../screens/caategory_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  //const CategoryItem({Key key}) : super(key: key);
  CategoryItem(this.title, this.color, this.id);

  void selectCategory(BuildContext ctx) {
    // By Simple Push method
    /*  Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_) {
        return CategoryMealsScreen(id,title);
      },
    )); */
    // By Naming Push
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        )),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
