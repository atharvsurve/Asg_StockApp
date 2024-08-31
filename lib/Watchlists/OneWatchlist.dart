import 'package:flutter/material.dart';
import 'package:internship_asg/Components/Searchbar.dart';
import 'package:internship_asg/Components/StocksList.dart';

class Onewatchlist extends StatefulWidget {
  const Onewatchlist({super.key});

  @override
  State<Onewatchlist> createState() => _OnewatchlistState();
}

class _OnewatchlistState extends State<Onewatchlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Searchbar(),
        SizedBox(
          height: 15,
        ),
        Stockslist(),
      ],
    ));
  }
}
