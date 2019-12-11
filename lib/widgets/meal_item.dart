import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  //const MealItem({Key key}) : super(key: key);
  final String id;
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affodability;
  final Function removeItem;

  MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageURL,
      @required this.affodability,
      @required this.complexity,
      @required this.duration,
      @required this.removeItem});

  String get complexityTest {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Difficult';

        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityTest {
    switch (affodability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Average';
        break;
      case Affordability.Pricey:
        return 'Costly';

        break;
      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
          MealDetailsScreen.routeName,
          arguments: id,
        )
        .then((result) => {
              if (result != null) {removeItem(result)}
            });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imageURL,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text(complexityTest),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 5,
                      ),
                      Text(affordabilityTest),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
