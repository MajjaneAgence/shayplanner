import 'package:flutter/material.dart';

class HomeSearchScreen extends StatelessWidget {
    static const routename = '/home-search';

  @override
  Widget build(BuildContext context) {
    showSearch(context: context, delegate: CustomSearchDelegate());
    return SizedBox();
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Search Demo'),
    //     actions: [
    //       IconButton(
    //         icon: Icon(Icons.search),
    //         onPressed: () {
    //           showSearch(context: context, delegate: CustomSearchDelegate());
    //         },
    //       ),
    //     ],
    //   ),
    //   body: Center(
    //     child: Text('Press the search icon to start searching.'),
    //   ),
    // );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Durian',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
    'Jackfruit',
    'Kiwi',
    'Lemon',
    'Mango',
    'Nectarine',
    'Orange',
    'Papaya',
    'Quince',
    'Raspberry',
    'Strawberry',
    'Tangerine',
    'Ugli fruit',
    'Vanilla bean',
    'Watermelon',
    'Xigua melon',
    'Yellow kiwi',
    'Zucchini'
  ];

  final List<String> recentItems = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = items.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            close(context, suggestions[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = items.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}