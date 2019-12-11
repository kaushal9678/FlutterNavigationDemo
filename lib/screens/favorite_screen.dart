import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            affodability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            duration: favoriteMeals[index].duration,
            imageURL: favoriteMeals[index].imageUrl,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
