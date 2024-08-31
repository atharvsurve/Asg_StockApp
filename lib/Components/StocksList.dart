import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Stockslist extends StatefulWidget {
  const Stockslist({super.key});

  @override
  State<Stockslist> createState() => _StockslistState();
}

class _StockslistState extends State<Stockslist> {
  List _items = [];
  @override
  void initState() {
    super.initState();
    readJson(); // Load JSON data when the widget is initialized
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('lib/jsonFile/db.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["data"];
    });
  }

  bool isPos(item) {
    if (item >= 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        child: _items.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.5),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _items[index]["Name"],
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                _items[index]['Amount'],
                                style: TextStyle(
                                    color: isPos(_items[index]['IntraDay'])
                                        ? Colors.green
                                        : Colors.red,
                                    fontSize: 11),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_items[index]['desc'],
                                  style: const TextStyle(
                                    fontSize: 8,
                                  )),
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      "${_items[index]["IntraDay"]}",
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.01,
                                    ),
                                    Text(_items[index]['percent'])
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: screenHeight * 0.002,
                            color: Colors.grey.withOpacity(0.3),
                          )
                        ]),
                      );
                    }))
            : const SizedBox(
                child: const Text("No Watchlist added"),
              ));
  }
}
