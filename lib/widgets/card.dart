// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

import '../main.dart';

class CardWidget extends StatelessWidget {
  final String mytitle;
  final String person;
  final Quotes_card index;
  final Function delete;

  const CardWidget(
      {super.key,
      required this.mytitle,
      required this.person,
      required this.delete,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              mytitle,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  person,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    delete(index);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                    size: 22,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      color: Color.fromARGB(255, 547, 66, 151),
    );
  }
}
