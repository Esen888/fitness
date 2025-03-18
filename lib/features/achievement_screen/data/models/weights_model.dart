// To parse this JSON data, do
//
//     final weightsModel = weightsModelFromJson(jsonString);

import 'dart:convert';

WeightsModel weightsModelFromJson(String str) => WeightsModel.fromJson(json.decode(str));

String weightsModelToJson(WeightsModel data) => json.encode(data.toJson());

class WeightsModel {
    String? status;
    List<Datum>? data;

    WeightsModel({
        this.status,
        this.data,
    });

    factory WeightsModel.fromJson(Map<String, dynamic> json) => WeightsModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    int? userId;
    int? weight;
    DateTime? createdAt;
    DateTime? updatedAt;

    Datum({
        this.id,
        this.userId,
        this.weight,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        weight: json["weight"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "weight": weight,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
