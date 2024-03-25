import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class  DayModel{
  final int? id;
  final String? name;
  final List<dynamic>? heures;


  DayModel({
     this.id,
     this.name,
     this.heures,
  });
 factory DayModel.fromJson(Map<String, dynamic> json) {
  Locale locale = Get.locale ?? Locale("fr");
  String name="";
switch (int.parse(json['jour'])) {
      case 1:
        name= DateFormat('EEEE', locale.toString()).format(DateTime.now());
      case 2:
         name= DateFormat('EEEE', locale.toString()).format(DateTime.now().add(Duration(days: 1)));
      case 3:
         name= DateFormat('EEEE', locale.toString()).format(DateTime.now().add(Duration(days: 2)));
      case 4:
         name= DateFormat('EEEE', locale.toString()).format(DateTime.now().add(Duration(days: 3)));
      case 5:
         name= DateFormat('EEEE', locale.toString()).format(DateTime.now().add(Duration(days: 4)));
      case 6:
         name= DateFormat('EEEE', locale.toString()).format(DateTime.now().add(Duration(days: 5)));
      case 7:
         name= DateFormat('EEEE', locale.toString()).format(DateTime.now().add(Duration(days: 6)));
      default: '';
    }    return DayModel(
      id: int.parse(json['jour']),
      name: name,
      heures: json['heure'] ?? [],
    );
  }


   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jour'] = this.id;
    //data['name'] = getLocalizedDayName( int.parse(data['jour']),Get.locale ?? Locale("fr"));
    data['heures'] = this.heures;
    return data;
  }

  String getLocalizedDayName(id,Locale locale) {
    print(id);
    var name;
    switch (id) {
      case 1:
        name= DateFormat('EEEE', locale.toString()).format(DateTime.now());
      case 2:
         name= DateFormat('EEEE', locale.toString()).format(DateTime.now().add(Duration(days: 1)));
      case 3:
         name= DateFormat('EEEE', locale.toString()).format(DateTime.now().add(Duration(days: 2)));
      case 4:
         name= DateFormat('EEEE', locale.toString()).format(DateTime.now().add(Duration(days: 3)));
      case 5:
         name= DateFormat('EEEE', locale.toString()).format(DateTime.now().add(Duration(days: 4)));
      case 6:
         name= DateFormat('EEEE', locale.toString()).format(DateTime.now().add(Duration(days: 5)));
      case 7:
         name= DateFormat('EEEE', locale.toString()).format(DateTime.now().add(Duration(days: 6)));
      default: '';
    }
    return name;
  }

}
