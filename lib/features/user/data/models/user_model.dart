// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
    String? status;
    Data? data;

    UserProfileModel({
        this.status,
        this.data,
    });

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    User? user;

    Data({
        this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    String? name;
    String? phone;
    dynamic emailVerifiedAt;
    String? code;
    dynamic createdAt;
    DateTime? updatedAt;

    User({
        this.id,
        this.name,
        this.phone,
        this.emailVerifiedAt,
        this.code,
        this.createdAt,
        this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        emailVerifiedAt: json["email_verified_at"],
        code: json["code"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email_verified_at": emailVerifiedAt,
        "code": code,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
    };
}
