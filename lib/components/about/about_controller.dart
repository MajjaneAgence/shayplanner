import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shayplanner/models/user_model.dart';

class AboutController extends GetxController {
  var isExpanded = false.obs;
  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  RxBool isExpandedFaq = false.obs;

  String aboutDesc =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \nUt enim ad minim veniam, quis nostrud adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat";
  Rx<UserModel?> user = UserModel().obs;
  Rx<File> picture = Rx<File>(File(''));

  RxList<Map<String, dynamic>> faqList = [
    {
      "id": 1,
      'question': 'Lorem ipsum dolor sit amet?'.tr,
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \nUt enim ad minim veniam, quis nostrud adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'.tr,
      "isExpanded": false
    },
    {
      "id": 2,
      'question': 'Lorem ipsum dolor sit amet?'.tr,
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \nUt enim ad minim veniam, quis nostrud adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'.tr,
      "isExpanded": false
    },
    // Add more FAQ items as needed
  ].obs;
  @override
  void onInit() async {
    super.onInit();
  }

  openFaqs(id) {
    for (var item in faqList) {
      if(item['id']!=id)
      {item['isExpanded'] = false;}
    }
        faqList.refresh();

    var itemToUpdate = faqList.firstWhere((item) => item['id'] == id);
    itemToUpdate['isExpanded'] = !itemToUpdate['isExpanded'];
    faqList.refresh();
  }
}
