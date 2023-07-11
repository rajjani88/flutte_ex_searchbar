import 'package:flutte_ex_searchbar/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> names = [
    'Cat',
    'Dog',
    'Monkey',
    'Donkey',
    'Fish',
    'Goat',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Example'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                names[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
