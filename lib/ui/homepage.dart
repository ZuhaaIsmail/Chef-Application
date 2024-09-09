import 'package:chef_application/ui/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  int selectedCategory = 0;
  final category = ['All', 'Breakfast', 'Asian Food', 'Dessert'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Delicious',
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              const Text('Easy to cook menu',
                  style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 31)),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 18, top: 16, bottom: 16),
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.grey.shade50,
                  surfaceTintColor: Colors.grey.shade500,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: TextField(
                    controller: searchController,
                    cursorColor: const Color.fromARGB(255, 249, 97, 99),
                    decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 10),
                          child: Icon(Icons.search_sharp,
                              color: Colors.black, size: 32),
                        ),
                        hintText: 'Search your perfect recipe',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none)),
                  ),
                ),
              ),
              const Text('Category',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              const SizedBox(height: 14),
              Expanded(
                flex: 12,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          selectedCategory = index;});
                      },
                      child: MyCard(
                          category[index],
                          isSelected: selectedCategory == index));
                },
                  itemCount: category.length,
                ),
              ),
              const SizedBox(height: 18),
              const Text('Popular',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              const SizedBox(height: 16),
              Expanded(
                flex: 60,
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Grid(selectedCategory: selectedCategory,)
                ),
              ),
            ],
          ),
        ));
  }
}
