import 'package:flutter/material.dart';
import 'package:internship_asg/Watchlists/OneWatchlist.dart';
import 'package:internship_asg/Watchlists/TwoWatchlist.dart';

class WatchlistBar extends StatefulWidget {
  const WatchlistBar({super.key});

  @override
  State<WatchlistBar> createState() => _WatchlistBarState();
}

class _WatchlistBarState extends State<WatchlistBar> {
  // State variables
  int _selectedIndex = 0;

  // List of items to display in the horizontal list
  final List<Widget> _items = [
    const Onewatchlist(),
    const Twowatchlist(),
    const Onewatchlist(),
    const Onewatchlist()
  ];

  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  Decoration _getItemDecoration(int index) {
    if (index == _selectedIndex) {
      return const BoxDecoration(
        color: Colors.black,
      );
    } else {
      return const BoxDecoration();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(children: [
      Container(
        height: screenHeight * 0.1,
        padding: EdgeInsets.fromLTRB(
          screenWidth * 0.02,
          screenHeight * 0.0,
          screenWidth * 0.0,
          screenHeight * 0.01,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            bool isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: Container(
                width: screenWidth * 0.24,
                margin: EdgeInsets.fromLTRB(
                  screenWidth * 0.0,
                  screenHeight * 0.03,
                  screenWidth * 0.0,
                  screenHeight * 0.01,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Watchlist ${index + 1}",
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Container(
                          height: 3.5, decoration: _getItemDecoration(index))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      Container(
          height: screenHeight * 0.698,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return _items[index]; // Return the actual widget from the list
            },
          ))
    ]);
  }
}
