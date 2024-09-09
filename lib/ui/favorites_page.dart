import 'package:chef_application/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:chef_application/data_set/data.dart';
import 'package:chef_application/data_set/recipes.dart';
class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Recipes> favoriteRecipes = Data.favoriteRecipes;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: favoriteRecipes.length,
          itemBuilder: (context, index) {
            var recipe = favoriteRecipes[index];
            return RecipeCard(
              image: recipe.image,
              title: recipe.title,
              time: recipe.time,
              rating: recipe.rating,
              recipeIndex: index,
            );
          },
        )
        ),
      );
  }
}
