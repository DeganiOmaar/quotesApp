// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:quote_app/widgets/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotes(),
    );
  }
}

class Quotes_card {
  String title;
  String author;

  Quotes_card({required this.title, required this.author});
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});
  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  List AllQuotes = [
    Quotes_card(author: "Lboss", title: "Let's start with Flutter"),
    Quotes_card(author: "Laamyr", title: "Let's start with Flutter"),
    Quotes_card(author: "Sy Omar", title: "Let's start with Flutter"),
  ];

  delete(index) {
    setState(() {
      AllQuotes.remove(index);
    });
  }

  addNewQuote() {
    setState(() {
      AllQuotes.add(
        Quotes_card(title: myController.text, author: myController2.text),
      );
    });
  }

  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 57, 121),
        title: Text(
          "Best Quotes",
          style: TextStyle(fontSize: 27),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 50,
                        decoration: InputDecoration(hintText: "Add New Quote"),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextField(
                        controller: myController2,
                        maxLength: 20,
                        decoration: InputDecoration(hintText: "Add Author"),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          addNewQuote();
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...AllQuotes.map((item) => CardWidget(
                  mytitle: item.title,
                  person: item.author,
                  delete: delete,
                  index: item,
                )).toList()
          ],
        ),
      ),
    );
  }
}
