import 'package:chef_application/data_set/data.dart';
import 'package:chef_application/ui/favorites_page.dart';
import 'package:chef_application/ui/homepage.dart';
import 'package:chef_application/ui/settings.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        titleSpacing: 24,
        surfaceTintColor: Colors.white,
        title: Text(Data.titles[selectedIndex], style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 20),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 249, 97, 99),
                  borderRadius: BorderRadius.circular(16)),
              child: const Icon(
                Icons.notifications_none_sharp,
                size: 28,
                color: Colors.white,
              )),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          const HomePage(),
          const FavoritePage(),
          Settings(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          selectedItemColor: const Color.fromARGB(255, 249, 97, 99),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}
