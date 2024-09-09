import 'package:chef_application/data_set/data.dart';
import 'package:chef_application/data_set/recipes.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final Recipes recipe;
  final int itemIndex;
  const Details(this.recipe, this.itemIndex, {super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 70,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 18),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                  color: widget.recipe.isFavorite
                      ? const Color.fromARGB(255, 230, 226, 226)
                      : const Color.fromARGB(255, 249, 97, 99),
                  borderRadius: BorderRadius.circular(16)),
              child: IconButton(
                onPressed: () {
                  widget.recipe.isFavorite = !widget.recipe.isFavorite;
                  setState(() {
                    Data.allRecipes[widget.itemIndex].isFavorite = widget.recipe.isFavorite;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  size: 24,
                  color: widget.recipe.isFavorite
                      ? const Color.fromARGB(255, 249, 97, 99)
                      : Colors.white,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(

              padding: const EdgeInsets.only(top: 10.0, bottom: 2),
              child: SizedBox(
                  width: double.maxFinite,
                  child: Image.asset(widget.recipe.image, width: 330, height: 320)),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                [Text(widget.recipe.title,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w800)),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Color.fromARGB(255, 249, 97, 99),
                      size: 16,
                    ),
                    const SizedBox(width: 3),
                    Text(widget.recipe.time,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(width: 14),
                    const Icon(Icons.star,
                        color: Color.fromARGB(255, 249, 97, 99), size: 15),
                    const SizedBox(width: 3),
                    Text('${widget.recipe.rating}',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500)),
                  ],
                )
              ])
            ),
            const Padding(
              padding: EdgeInsets.only(left: 22.0),
              child: Text('Ingredients', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 249, 97, 99))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, top: 10),
              child: Text(widget.recipe.ingredients, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 2.2)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 22.0, top: 10),
              child: Text('Details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 249, 97, 99))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, top: 10, right:22),
              child: Text('${widget.recipe.title} is a popular dish. Its taste and rich flavor will astonish you. It is made with very simple ingredients that you can find at home easily. Let\'s try!', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1.3)),
            ),
            const SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}
