// To parse this JSON data, do
//
//     final sectionsModel = sectionsModelFromJson(jsonString);

import 'dart:convert';

SectionsModel sectionsModelFromJson(String str) => SectionsModel.fromJson(json.decode(str));

String sectionsModelToJson(SectionsModel data) => json.encode(data.toJson());

class SectionsModel {
    String status;
    List<Datum> data;

    SectionsModel({
        required this.status,
        required this.data,
    });

    factory SectionsModel.fromJson(Map<String, dynamic> json) => SectionsModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;
    dynamic createdAt;
    dynamic updatedAt;

    Datum({
        required this.id,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
