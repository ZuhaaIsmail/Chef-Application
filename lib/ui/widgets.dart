// ignore_for_file: must_be_immutable

import 'package:chef_application/data_set/data.dart';
import 'package:chef_application/data_set/recipes.dart';
import 'package:chef_application/ui/details_page.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatefulWidget {
  String image, title, time;
  double rating;
  bool isFavorite = false;
  int recipeIndex;

  RecipeCard(
      {required this.image,
      required this.title,
      required this.time,
      required this.rating,
      required this.recipeIndex,
      super.key});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 16),
            Image.asset(widget.image, width: 130, height: 130),
            const SizedBox(height: 32),
            Text(widget.title,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.time,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500)),
                const SizedBox(width: 10),
                const Icon(Icons.star,
                    color: Color.fromARGB(255, 249, 97, 99), size: 14),
                const SizedBox(width: 3),
                Text('${widget.rating}',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500))
              ],
            ),
            const SizedBox(height: 12),
          ]),
        ),
      ),
      Positioned(
          top: 18,
          right: 18,
          child: InkWell(
              onTap: () {
                setState(() {
                  widget.isFavorite = !widget.isFavorite;
                  Data.allRecipes[widget.recipeIndex].isFavorite = widget.isFavorite;
                  if(widget.isFavorite == true){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text('Added to Favorite Recipes!'),
                        backgroundColor: const Color.fromARGB(220, 249, 97, 99),
                          duration: const Duration(seconds: 2),
                          action: SnackBarAction(label: 'Undo', onPressed: () {
                            setState(() {
                              widget.isFavorite = false;
                              Data.allRecipes[widget.recipeIndex].isFavorite = false;
                            });
                          },)
                        ));
                  }
                });
              },
              child: Icon(
                  widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: widget.isFavorite ? Colors.red : Colors.black)))
    ]);
  }
}

class MyCard extends StatefulWidget {
  String text;
  bool isSelected;
  MyCard(this.text, {super.key, required this.isSelected});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
      child: Card(
          color: widget.isSelected
              ? const Color.fromARGB(255, 249, 97, 99)
              : Colors.white,
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 22),
            child: Text(widget.text,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: widget.isSelected ? Colors.white : Colors.black)),
          ))),
    );
  }
}

class Grid extends StatelessWidget {
  final int selectedCategory;
  const Grid({required this.selectedCategory, super.key});

  @override
  Widget build(BuildContext context) {
    List<Recipes> recipes;
    switch (selectedCategory) {
      case 1:
        recipes = Data.breakfastRecipes;
        break;
      case 2:
        recipes = Data.asianRecipes;
        break;
      case 3:
        recipes = Data.dessertRecipes;
        break;
      default:
        recipes = Data.allRecipes;
        break;
    }
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        var recipe = recipes[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(recipe, index),
                ));
          },
          child: RecipeCard(
            image: recipe.image,
            title: recipe.title,
            time: recipe.time,
            rating: recipe.rating,
            recipeIndex: index,
          ),
        );
      },
      itemCount: recipes.length,
    );
  }
}
