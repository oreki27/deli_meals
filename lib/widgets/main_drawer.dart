import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold, //w700
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            color: Theme.of(context).accentColor,
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height * 0.15,
            alignment: Alignment.centerLeft,
            width: double.infinity,
          ),
          buildListTile(
              "Meals",
              Icons.restaurant,
              () {
                Navigator.of(context).pushReplacementNamed("/");
              }
          ),
          buildListTile(
              "Filters",
              Icons.settings,
              () {
                Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              }
          ),

        ],
      )
    );
  }
}
