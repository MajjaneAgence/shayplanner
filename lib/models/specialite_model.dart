class SpecialiteModel {
  final int id;
  final String name;
  final String pictureUrl;
  final String duration;
  final String price;
  final int isDeleted;


  SpecialiteModel({
    required this.id,
    required this.name,
    required this.pictureUrl,
    required this.duration,
    required this.price,
    required this.isDeleted,
  });
 factory SpecialiteModel.fromJson(Map<String, dynamic> json) {
    return SpecialiteModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      pictureUrl: json['picture'] ?? '',
      duration :json['duration']?? '',
      price: json['price']??'',
      isDeleted: json['is_deleted'] ?? 0,
    );
  }


   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.pictureUrl;
    data['is_deleted'] = this.isDeleted;


    return data;
  }
}
