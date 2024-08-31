import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship_asg/WatchlistMain.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int myIndex = 0;
  double opacity = 0.5;
  List<Widget> widgetList = [
    const WatchlistMain(),
    const Text(
      "A",
      style: TextStyle(fontSize: 40),
    ),
    const Text(
      "B",
      style: TextStyle(fontSize: 40),
    ),
    const Text(
      "C",
      style: TextStyle(fontSize: 40),
    ),
    const Text(
      "E",
      style: TextStyle(fontSize: 40),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: myIndex,
        children: widgetList,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => {
                setState(() {
                  myIndex = index;
                  opacity = 1;
                })
              },
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(0.5),
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_border,
                ),
                label: "Watchlist",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: "Order",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: "Protfolio",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet_outlined,
              ),
              label: "Funds",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_4_outlined,
                ),
                label: "Profile",
                backgroundColor: Colors.white),
          ]),
    );
  }
}
