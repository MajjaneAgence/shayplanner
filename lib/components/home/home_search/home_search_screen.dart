import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/home/home_service.dart';
import 'package:shayplanner/components/salons/salons_controller.dart';
import 'package:shayplanner/components/salons/salons_screen.dart';
import 'package:shayplanner/theme/theme_colors.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final String type;
  final List<String> recentItems = [];
  List items = [];

  CustomSearchDelegate({required this.type});
  @override
  String get searchFieldLabel => 'tr_search'.tr;

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
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]["name"]),
          onTap: () {
            close(context, items[index]["name"]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Widget resultContent() {
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]["name"]),
            onTap: () {
              query = items[index]["name"];
              print(items[index]["type"]);
              if (items[index]["type"] == "salon") {
                Get.delete<SalonsController>();
                Get.toNamed(SalonsScreen.routename, arguments: {
                  'filterBy': 'salon',
                  'salon_id': items[index]["id"]
                });
              } else if (items[index]["type"] == "category") {
                Get.delete<SalonsController>();
                Get.toNamed(SalonsScreen.routename, arguments: {
                  'filterBy': 'categories',
                  'category_id': items[index]["id"]
                });
              } else if (items[index]["type"] == "specialite") {
                Get.delete<SalonsController>();
                Get.toNamed(SalonsScreen.routename, arguments: {
                  'filterBy': 'specialite',
                  'specialite_id': items[index]["id"]
                });
              }
              else if (items[index]["type"] == "address") {
                Get.delete<SalonsController>();
                Get.toNamed(SalonsScreen.routename, arguments: {
                  'filterBy': 'address',
                  'salon_id': items[index]["id"]
                });
              }
              //showResults(context);
            },
          );
        },
      );
    }

    return query != ''
        ? FutureBuilder(
            future: type == "SearchByNameCategorySpecialite"
                ? HomeService().apiSearchByNameCategorieSpecialite(query)
                : HomeService().apiSearchByAddress(query),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                print(snapshot.data);
                if (snapshot.data["success"]) {
                  if (snapshot.data["data"].length != 0) {
                    items.clear();
                    if (snapshot.data["data"]["address"] != null) {
                      for (var item in snapshot.data["data"]["address"]) {
                        item['type'] = "address";
                        items.add(item);
                      }
                    } else {
                      for (var item in snapshot.data["data"]["salons"]) {
                        item['type'] = "salon";
                        items.add(item);
                      }
                      for (var item in snapshot.data["data"]["categories"]) {
                        item['type'] = "category";
                        items.add(item);
                      }
                      for (var item in snapshot.data["data"]["specialites"]) {
                        item['type'] = "specialite";
                        items.add(item);
                      }
                    }
                    print(items);
                  }
                }
                return resultContent();
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: crem,
                ));
              } else {
                return SizedBox();
              }
            })
        : SizedBox();
  }
}
