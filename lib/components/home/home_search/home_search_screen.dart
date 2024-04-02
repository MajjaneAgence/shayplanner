import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/home/home_service.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  // final List<String> items = [
  //   'Apple',
  //   'Banana',
  //   'Cherry',
  //   'Durian',
  //   'Elderberry',
  //   'Fig',
  //   'Grapes',
  //   'Honeydew',
  //   'Jackfruit',
  //   'Kiwi',
  //   'Lemon',
  //   'Mango',
  //   'Nectarine',
  //   'Orange',
  //   'Papaya',
  //   'Quince',
  //   'Raspberry',
  //   'Strawberry',
  //   'Tangerine',
  //   'Ugli fruit',
  //   'Vanilla bean',
  //   'Watermelon',
  //   'Xigua melon',
  //   'Yellow kiwi',
  //   'Zucchini'
  // ];

  final List<String> recentItems = [];
   List items =[];
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
        print("here");
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
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
  //   List list = [];
  //   HomeService().apiSearch(query).then((value) async {
  //     var body = jsonDecode(value.body);
  //     print(body);
  //     if (body["success"]) {
  //       list.clear();
  //       for (var item in body["data"]["salons"]) {
  //         list.add(item);
  //       }
  //       for (var item in body["data"]["categories"]) {
  //         list.add(item);
  //       }
  //       for (var item in body["data"]["specialites"]) {
  //         list.add(item);
  //       }
  //               print(list);

  //     }
  //   });
  // items=list;
  //   final suggestions = items.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
  //   return ListView.builder(
  //     itemCount: suggestions.length,
  //     itemBuilder: (context, index) {
  //       return ListTile(
  //         title: Text(suggestions[index]),
  //         onTap: () {
  //           query = suggestions[index];
  //           showResults(context);
  //         },
  //       );
  //     },
  //   );
      return FutureBuilder(
      future: HomeService().apiSearch(query), // Assuming query is defined somewhere
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || !(snapshot.data as Map<String, dynamic>)['success']) {
          return Center(child: Text('No data available'));
        } else {
          var body = jsonDecode(snapshot.data.body);
          List<dynamic> items = [];
          if (body["success"]) {
            for (var item in body["data"]["salons"]) {
              items.add(item);
            }
            for (var item in body["data"]["categories"]) {
              items.add(item);
            }
            for (var item in body["data"]["specialites"]) {
              items.add(item);
            }
          }
          final suggestions = items
              .where((item) => item['name'].toLowerCase().contains(query.toLowerCase()))
              .toList();
          return ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(suggestions[index]['name']),
                onTap: () {
                  // Handle item tap
                  // Example: query = suggestions[index]['name'];
                  // showResults(context);
                },
              );
            },
          );
        }
      },
    );
  }
}
