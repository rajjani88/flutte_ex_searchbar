import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  List<String> names = [
    'Cat',
    'Dog',
    'Monkey',
    'Donkey',
    'Fish',
    'Goat',
  ];

  List<String> suggestions = [];

  List<String> results = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    results.clear();
    if (query.isNotEmpty) {
      for (var e in names) {
        if (e.toLowerCase().contains(query.toLowerCase())) {
          results.add(e);
        }
      }

      if (results.isEmpty) {
        return Card(
          child: ListTile(
            title: Text(
              'No Results',
            ),
          ),
        );
      }

      return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  results[index],
                ),
              ),
            );
          });
    } else {
      return const Text('No Results');
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    suggestions.clear();
    if (query.isNotEmpty) {
      for (var e in names) {
        if (e.toLowerCase().contains(query.toLowerCase())) {
          suggestions.add(e);
        }
      }

      if (suggestions.isEmpty) {
        return Card(
          child: ListTile(
            title: Text(
              'No Results',
            ),
          ),
        );
      }

      return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  suggestions[index],
                ),
              ),
            );
          });
    } else {
      return const Text('No Results');
    }
  }
}
