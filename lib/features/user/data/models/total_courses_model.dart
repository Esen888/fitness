// To parse this JSON data, do
//
//     final totalUserCousesModel = totalUserCousesModelFromJson(jsonString);

import 'dart:convert';

TotalUserCousesModel totalUserCousesModelFromJson(String str) => TotalUserCousesModel.fromJson(json.decode(str));

String totalUserCousesModelToJson(TotalUserCousesModel data) => json.encode(data.toJson());

class TotalUserCousesModel {
    String? status;
    List<Datum>? data;

    TotalUserCousesModel({
        this.status,
        this.data,
    });

    factory TotalUserCousesModel.fromJson(Map<String, dynamic> json) => TotalUserCousesModel(
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
    int? bloggerId;
    String? image;
    String? name;
    dynamic createdAt;
    DateTime? updatedAt;
    int? price;
    String? description;
    bool? attached;
    bool? isFree;
    String? imageUrl;
    Pivot? pivot;
    Blogger? blogger;

    Datum({
        this.id,
        this.bloggerId,
        this.image,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.price,
        this.description,
        this.attached,
        this.isFree,
        this.imageUrl,
        this.pivot,
        this.blogger,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        bloggerId: json["blogger_id"],
        image: json["image"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        price: json["price"],
        description: json["description"],
        attached: json["attached"],
        isFree: json["is_free"],
        imageUrl: json["image_url"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
        blogger: json["blogger"] == null ? null : Blogger.fromJson(json["blogger"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "blogger_id": bloggerId,
        "image": image,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "price": price,
        "description": description,
        "attached": attached,
        "is_free": isFree,
        "image_url": imageUrl,
        "pivot": pivot?.toJson(),
        "blogger": blogger?.toJson(),
    };
}

class Blogger {
    int? id;
    int? userId;
    int? sectionId;
    String? name;
    String? image;
    dynamic createdAt;
    DateTime? updatedAt;

    Blogger({
        this.id,
        this.userId,
        this.sectionId,
        this.name,
        this.image,
        this.createdAt,
        this.updatedAt,
    });

    factory Blogger.fromJson(Map<String, dynamic> json) => Blogger(
        id: json["id"],
        userId: json["user_id"],
        sectionId: json["section_id"],
        name: json["name"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "section_id": sectionId,
        "name": name,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Pivot {
    int? userId;
    int? courseId;

    Pivot({
        this.userId,
        this.courseId,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        courseId: json["course_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "course_id": courseId,
    };
}
