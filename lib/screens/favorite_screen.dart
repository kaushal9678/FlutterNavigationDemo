import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  //const FavoriteScreen({Key key}) : super(key: key);

  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("Favorites"),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: favoriteMeals[index].title,
              affodability: favoriteMeals[index].affordability,
              imageURL: favoriteMeals[index].imageUrl,
              complexity: favoriteMeals[index].complexity,
              duration: favoriteMeals[index].duration,
              id: favoriteMeals[index].id,
            );
          },
          itemCount: favoriteMeals.length);
    }
  }
}
