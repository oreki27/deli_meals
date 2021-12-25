import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildContainer(BuildContext context,String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildWidget(BuildContext context,Widget child) {
    return Container(
        decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey,),
    borderRadius: BorderRadius.circular(10)
    ),
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    height: MediaQuery.of(context).size.height * 0.20,
    width: MediaQuery.of(context).size.width * 0.7,
    child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final meal = DUMMY_MEALS.where((element) => element.id == mealId).toList()[0];
    return Scaffold(
      appBar: AppBar(
        title:  Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildContainer(context,"Ingredients"),
            buildWidget(
              context,
              ListView.builder(
                itemBuilder: (context,index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(meal.ingredients[index]),
                  ),
                  color: Theme.of(context).accentColor,
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            buildContainer(context,"Steps"),
            buildWidget(
              context,
              ListView.builder(
                  itemBuilder: (ctx,index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("# ${index + 1}"),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        Divider(),
                      ],
                    );
                  },
                itemCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
