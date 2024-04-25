// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) => CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
    String? status;
    Data? data;

    CourseModel({
        this.status,
        this.data,
    });

    factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    int? bloggerId;
    String? image;
    String? name;
    dynamic createdAt;
    DateTime? updatedAt;
    int? price;
    String? description;
    String? videoLink;
    bool? attached;
    bool? isFree;
    String? imageUrl;
    List<Week>? weeks;
    Blogger? blogger;

    Data({
        this.id,
        this.bloggerId,
        this.image,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.price,
        this.description,
        this.videoLink,
        this.attached,
        this.isFree,
        this.imageUrl,
        this.weeks,
        this.blogger,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        bloggerId: json["blogger_id"],
        image: json["image"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        price: json["price"],
        description: json["description"],
        videoLink: json["video_link"],
        attached: json["attached"],
        isFree: json["is_free"],
        imageUrl: json["image_url"],
        weeks: json["weeks"] == null ? [] : List<Week>.from(json["weeks"]!.map((x) => Week.fromJson(x))),
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
        "video_link": videoLink,
        "attached": attached,
        "is_free": isFree,
        "image_url": imageUrl,
        "weeks": weeks == null ? [] : List<dynamic>.from(weeks!.map((x) => x.toJson())),
        "blogger": blogger?.toJson(),
    };
}

class Blogger {
    int? id;
    int? sectionId;
    String? name;
    String? image;
    dynamic createdAt;
    DateTime? updatedAt;

    Blogger({
        this.id,
        this.sectionId,
        this.name,
        this.image,
        this.createdAt,
        this.updatedAt,
    });

    factory Blogger.fromJson(Map<String, dynamic> json) => Blogger(
        id: json["id"],
        sectionId: json["section_id"],
        name: json["name"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "section_id": sectionId,
        "name": name,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Week {
    int? id;
    int? courseId;
    int? number;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Day>? days;

    Week({
        this.id,
        this.courseId,
        this.number,
        this.createdAt,
        this.updatedAt,
        this.days,
    });

    factory Week.fromJson(Map<String, dynamic> json) => Week(
        id: json["id"],
        courseId: json["course_id"],
        number: json["number"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        days: json["days"] == null ? [] : List<Day>.from(json["days"]!.map((x) => Day.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "number": number,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "days": days == null ? [] : List<dynamic>.from(days!.map((x) => x.toJson())),
    };
}

class Day {
    int? id;
    String? name;
    dynamic createdAt;
    dynamic updatedAt;
    List<Exercise>? exercises;

    Day({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.exercises,
    });

    factory Day.fromJson(Map<String, dynamic> json) => Day(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        exercises: json["exercises"] == null ? [] : List<Exercise>.from(json["exercises"]!.map((x) => Exercise.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "exercises": exercises == null ? [] : List<dynamic>.from(exercises!.map((x) => x.toJson())),
    };
}

class Exercise {
    int? id;
    int? weekId;
    int? dayId;
    String? name;
    String? image;
    String? video;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? imageUrl;

    Exercise({
        this.id,
        this.weekId,
        this.dayId,
        this.name,
        this.image,
        this.video,
        this.createdAt,
        this.updatedAt,
        this.imageUrl,
    });

    factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json["id"],
        weekId: json["week_id"],
        dayId: json["day_id"],
        name: json["name"],
        image: json["image"],
        video: json["video"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "week_id": weekId,
        "day_id": dayId,
        "name": name,
        "image": image,
        "video": video,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_url": imageUrl,
    };
}
