import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {

  String password;
  String phone;


  LoginRequest({
    this.phone,
    this.password,
  });


  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    phone: json["phone"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "password": password,
  };


}
