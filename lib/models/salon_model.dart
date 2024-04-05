import 'dart:convert';

import 'package:shayplanner/models/day_model.dart';

class SalonModel {
   int? id;
    String? name;
   String? picture;
   String? address;
   String? about;
  //  List<DayModel>? times;
   List<dynamic>? morningsDays;
   List<dynamic>? afternoonDays;
     int? countRating;
   dynamic countAverage;
  List<String>? gallery;
   int? isDeleted;
   DateTime? createdAt;
   DateTime? updatedAt;

  SalonModel({
    this.id,
    this.name,
    this.picture,
    this.address,
    this.about,
    this.morningsDays,
    this.afternoonDays, 
    this.countRating,
    this.countAverage,
    this.gallery,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory SalonModel.fromJson(Map<String, dynamic> json) {
     List<String>? galleryUrls = [];
  if (json['gallery'] != null) {
    galleryUrls = [];
    for (var galleryItem in json['gallery']) {
      galleryUrls.add(galleryItem['picture']);
    }
  }

    return SalonModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      picture: json['picture'] ?? '',
      address: json['address'] ?? '',
      about: json['about'] ?? '',
      morningsDays: json['disponibilite'] != null ? json['disponibilite']['morningDays']  : [],
      afternoonDays: json['disponibilite'] != null ? json['disponibilite']['afternoonDays'] : [],
      countRating:json['count_rating'] ?? 0 ,
      countAverage: json['rating_avg'],
     gallery: galleryUrls,
      isDeleted: json['is_deleted'] ?? 0,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  List<DayModel> getDayTimes(configuration) {
    List<DayModel> times = [];
    for (var time in configuration) {
      times.add(DayModel.fromJson(time));
    }

    return times;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['address'] = this.address;
    data['about'] = this.about;
    data['morningDays'] = this.morningsDays;
    data['afternoonDays'] = this.afternoonDays;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['deleted_at'] = this.updatedAt;
    return data;
  }
}
