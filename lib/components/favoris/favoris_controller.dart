import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:shayplanner/models/user_model.dart';

class FavoriteController extends GetxController {
  RxBool isFavorite = true.obs;
  Rx<UserModel?> user = UserModel().obs;
  Rx<File> picture = Rx<File>(File(''));
  RxList<dynamic> list = [
    {
      "id": 1,
      "name": "name1",
      "isFavorite": true,
    },
    {
      "id": 2,
      "name": "name2",
      "isFavorite": false,
    },
    {
      "id": 3,
      "name": "name3",
      "isFavorite": true,
    },
    {
      "id": 4,
      "name": "name4",
      "isFavorite": true,
    },
    {
      "id": 5,
      "name": "name5",
      "isFavorite": true,
    },
  ].obs;
  @override
  void onInit() async {
    super.onInit();
  }

  doSomething() {}

  toggleFavorite(idToSearch) {
    var itemToUpdate = list.firstWhere((item) => item['id'] == idToSearch);
    itemToUpdate['isFavorite'] = !itemToUpdate['isFavorite'];
    list.refresh();
  }
}
