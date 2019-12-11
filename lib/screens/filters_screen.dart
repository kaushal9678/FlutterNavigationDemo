import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  //const FiltersScreen({Key key}) : super(key: key);
  static const routeName = '/filter-screen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFreee = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _lactoseFreee = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, subTitle, value, Function onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: onChanged,
    );
  }

  void onChangedGluten(newValue) {
    setState(() {
      _glutenFree = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter records"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selecteedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFreee,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selecteedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text("Adjust your meal selection",
                style: Theme.of(context).textTheme.title),
            padding: EdgeInsets.all(20),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                    "Gluten Free",
                    "Only include gluten free meals",
                    _glutenFree,
                    onChangedGluten),
                Divider(),
                buildSwitchListTile(
                    "Lactos-Free",
                    "Only include Lactos free meals",
                    _lactoseFreee, (newValue) {
                  setState(() {
                    _lactoseFreee = newValue;
                  });
                }),
                Divider(),
                buildSwitchListTile(
                    "Vegan-Free", "Only include Vegan free meals", _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                Divider(),
                buildSwitchListTile(
                    "Vegetarian", "Only include Vegetarian meals", _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
