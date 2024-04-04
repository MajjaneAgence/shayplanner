class AppointementModel {
  final int id;
  final String date;
  final String temps;
  final String specialite;
  final String duration;
  final String price;

  AppointementModel(
      {required this.id,
      required this.date,
      required this.temps,
      required this.specialite,
      required this.duration,
      required this.price});
  factory AppointementModel.fromJson(Map<String, dynamic> json) {
    return AppointementModel(
      id: json['id'] ?? 0,
      date: json['Date'] ?? '',
      temps: json['temps'] ?? '',
      specialite: json['specialite'] ?? '',
      duration: json['duration'] ?? '',
      price: json['price'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['temps'] = this.temps;
    data['specialite'] = this.specialite;
    data['duration'] = this.duration;
    data['price'] = this.price;

    return data;
  }
}
