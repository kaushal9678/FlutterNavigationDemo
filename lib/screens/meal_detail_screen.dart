import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meals.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailsScreen({Key key}) : super(key: key);

  Widget buildSectionTitle(String title, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(
    Widget child,
    double width,
    BuildContext context,
  ) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blueGrey),
        ),
        margin: EdgeInsets.all(5),
        width: width,
        padding: EdgeInsets.all(5),
        height: 220,
        child: child);
  }

  Widget buildListView(Meal selectedMeal, BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => Card(
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(selectedMeal.ingredients[index]),
        ),
      ),
      itemCount: selectedMeal.ingredients.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final deviceData = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle("Ingredients", context),
            buildContainer(buildListView(selectedMeal, context),
                deviceData.width, context),
            buildSectionTitle("Steps", context),
            buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '# ${index + 1}',
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
                deviceData.width,
                context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
