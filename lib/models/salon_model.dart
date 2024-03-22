class SalonModel {
  final int? id;
  final String? name;
  final String? picture;
  final String? address;
  final String? about;
  final int? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SalonModel({
    this.id,
    this.name,
    this.picture,
    this.address,
    this.about,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });
  factory SalonModel.fromJson(Map<String, dynamic> json) {
    return SalonModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      picture: json['picture'] ?? '',
      address: json['address'] ?? '',
      about: json['about'] ?? '',
      isDeleted: json['is_deleted'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['address'] = this.address;
    data['about'] = this.about;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['deleted_at'] = this.updatedAt;
    return data;
  }
}
