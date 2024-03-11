class UserModel {
   int? id;
   String? firstname;
   String? lastname;
   String? email;
   String? city;
   DateTime? birthdate;
   String? gender;
   String? mobile;
   String? address;
   String? picture;
   int? roleId;
   int? isDeleted;
   DateTime? createdAt;
   DateTime? updatedAt;

  UserModel({
     this.id,
     this.firstname,
     this.lastname,
     this.email,
    this.city,
    this.birthdate,
    this.gender,
    this.mobile,
    this.address,
    this.picture,
     this.roleId,
     this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      email: json['email'] ?? '',
      city: json['city'] ?? '',
      birthdate:
          json['birthdate'] != null ? DateTime.parse(json['birthdate']) : null,
      gender: json['gender'] ?? '',
      mobile: json['mobile'] ?? '',
      address: json['address'] ?? '',
      picture: json['picture'] ?? '',
      roleId: json['role_id'] ?? 0,
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
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['city'] = this.city;
    data['birthdate'] = this.birthdate;
    data['gender'] = this.gender;
        data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['picture'] = this.picture;
    data['role_id'] = this.roleId;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['deleted_at'] = this.updatedAt;

    return data;
  }
}
