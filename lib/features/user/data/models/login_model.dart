// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    User? user;
    String? accessToken;
    String? tokenType;

    LoginModel({
        this.user,
        this.accessToken,
        this.tokenType,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
    };
}

class User {
    int? id;
    dynamic name;
    String? phone;
    dynamic emailVerifiedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic blogger;

    User({
        this.id,
        this.name,
        this.phone,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.blogger,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        blogger: json["blogger"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "blogger": blogger,
    };
}
