import 'package:flutter/material.dart';
import 'package:internship_asg/Components/WatchlistBar.dart';

class WatchlistMain extends StatefulWidget {
  const WatchlistMain({super.key});
  @override
  State<WatchlistMain> createState() => _WatchlistMainState();
}

class _WatchlistMainState extends State<WatchlistMain> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.04,
                screenHeight * 0.08,
                screenWidth * 0.04,
                screenHeight * 0.0,
              ),
              child: const Text(
                "Watchlist",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            const WatchlistBar(),
          ],
        ),
      ),
    );
  }
}
