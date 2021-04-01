import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.gender,
    this.email,
    this.phone,
    this.image,
    this.active,
    this.token,
    this.password,
    this.confirmPassword,
  });


  int id;
  String name;
  String gender;
  String address;
  String email;
  String phone;
  String image;
  int active;
  String token;
  String password;
  String confirmPassword;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    gender: json["gender"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    active: json["active"],
    token: json["token"],
    password: json["password"],
    confirmPassword: json["c_password"],
  );


  Map<String, dynamic> toJsonUpdate() => {
    "id": id,
    "name": name,
    "gender": gender,
    "address": address,
    "email": email,
    "phone": phone,
    "image": image,
    "active": active,
    "password":password,
    "c_password":confirmPassword,
  };
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender": gender,
    "address": address,
    "email": email,
    "phone": phone,
    "image": image,
    "active": active,
    "token": token,
    "password":password,
    "c_password":confirmPassword,
  };
}
