class ShopLoginModel {
  bool status;
  String message;
  UserData data;

  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? '';
    message = json['message'] ?? '';
    this.data = UserData.fromJson(json['data']) ?? '';
  }

  ShopLoginModel({this.status, this.message, this.data});
}

class UserData {
  int id;
  dynamic name = 'mouaz';
  dynamic email;
  dynamic phone;
  dynamic image;
  int points;
  int credit;
  String token;

  UserData(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.image,
      this.points,
      this.credit,
      this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    phone = json['phone'] ?? '';
    image = json['image'] ?? '';
    points = json['points'] ?? 0;
    credit = json['credit'] ?? 0;
    token = json['token'] ?? '';
  }
}
