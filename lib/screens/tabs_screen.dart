import 'package:flutter/material.dart';

import './categories_screen.dart';
import '../widgets/main_drawer.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPage = 0;

  final List<Map<String,dynamic>> _pages = [
    {
      "page":CategoriesScreen(),
      "title":"Meals"
    },
    {
      "page":FavouritesScreen(),
      "title":"Your Favourites"},
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPage]["page"],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Theme.of(context).backgroundColor,
          onTap: _selectPage,
          currentIndex: _selectedPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favourites",
            ),
          ],
        ),
    );
  }
}
