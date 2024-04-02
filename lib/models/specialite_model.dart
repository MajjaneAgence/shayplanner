class SpecialiteModel {
  final int id;
  final String name;
  final String pictureUrl;
  final String duration;
  final String price;
  final int isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SpecialiteModel({
    required this.id,
    required this.name,
    required this.pictureUrl,
    required this.duration,
    required this.price,
    required this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });
 factory SpecialiteModel.fromJson(Map<String, dynamic> json) {
    return SpecialiteModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      pictureUrl: json['picture'] ?? '',
      duration :json['duration'],
      price: json['price'],
      isDeleted: json['is_deleted'] ?? 0,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }


   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.pictureUrl;
    data['is_deleted'] = this.isDeleted;
        data['created_at'] = this.createdAt;
    data['deleted_at'] = this.updatedAt;

    return data;
  }
}
