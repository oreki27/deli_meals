import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meals_item.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> favourites;

  FavouritesScreen(this.favourites);

  @override
  Widget build(BuildContext context) {
    if(favourites.isEmpty) {
      return Center(
        child: Text("You have no favourites yet, please add some"),
      );
    }
    else {
      return ListView.builder(
        itemBuilder: (ctx,index) {
          return MealsItem(
              id: favourites[index].id,
              title: favourites[index].title,
              imageUrl: favourites[index].imageUrl,
              duration: favourites[index].duration,
              complexity: favourites[index].complexity,
              affordability: favourites[index].affordability,
          );
        },
        itemCount: favourites.length,
      );
    }
  }
}
