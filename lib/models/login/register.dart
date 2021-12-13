class LoginRes {
  String? id;
  String? name;
  String? phone;
  int? money;
  int? points;
  int? stars;
  String? token;

  LoginRes(
      {this.id,
      this.name,
      this.phone,
      this.money,
      this.points,
      this.stars,
      this.token});

  factory LoginRes.fromJson(Map<String, dynamic> json) {
    return LoginRes(
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
      money: json['money'],
      points: json['points'],
      stars: json['stars'],
      token: json['token'],
    );
  }
}
