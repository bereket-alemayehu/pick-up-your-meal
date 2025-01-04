import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;
  final void Function(Meal meal) onToggleFavorite;

  // ignore: empty_constructor_bodies

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where(
          (element) => element.categories.contains(category.id),
        )
        .toList();
    // here we use this method not to handle the change  because the  class is stateless but the reason we use this method here  is for  loading  data.
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      // which is scrollable by default .
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of column
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
        mainAxisSpacing:
            20, // this shows the vertical gap between the grid elements.
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectedCategory(context, category);
            },
          )
      ],
    );
  }
}
