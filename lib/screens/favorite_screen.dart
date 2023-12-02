import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no Favorite, Try adding some'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            //removeItem: _removeMeal,
            id: favoriteMeals[index].id,
            imageUrl: favoriteMeals[index].imageUrl,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            duration: favoriteMeals[index].duration,
            title: favoriteMeals[index].title,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
