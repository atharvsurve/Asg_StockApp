import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
        height: screenHeight * 0.07,
        width: screenWidth,
        child: TextField(
          decoration: InputDecoration(
            filled: true, 
            fillColor: Colors.white,
            hintText: 'Search stocks ,Futures ,Options & Indices',
            hintStyle: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(108, 117, 125, 1), 
            ),

            enabledBorder: const OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(20)), // Rounded corners
              borderSide: BorderSide(
                  color: Colors.grey, width: 1), 
            ),
            contentPadding: const EdgeInsets.fromLTRB(18.0, 12.0, 40.0, 1.0),
            

            suffixIcon: SizedBox(
                width: screenWidth * 0.18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 3,
                      height: 30, // Adjust the width as needed
                      color: const Color.fromARGB(255, 203, 202, 202),
                    ),
                    IconButton(
                      onPressed: () {
                        // Implement your filter logic here
                      },
                      icon: const Icon(Icons.tune),
                    ),
                  ],
                )),
          ),
          onChanged: (value) {
            // Implement your search logic here
          },
          textAlign: TextAlign.start, // Align text to the start
          textDirection: TextDirection.ltr,
        ));
  }
}
