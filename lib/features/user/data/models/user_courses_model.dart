// To parse this JSON data, do
//
//     final userCoursesModel = userCoursesModelFromJson(jsonString);

import 'dart:convert';

UserCoursesModel userCoursesModelFromJson(String str) => UserCoursesModel.fromJson(json.decode(str));

String userCoursesModelToJson(UserCoursesModel data) => json.encode(data.toJson());

class UserCoursesModel {
    String? status;
    Data? data;

    UserCoursesModel({
        this.status,
        this.data,
    });

    factory UserCoursesModel.fromJson(Map<String, dynamic> json) => UserCoursesModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    int? currentPage;
    List<Datum>? data;
    String? firstPageUrl;
    int? from;
    int? lastPage;
    String? lastPageUrl;
    List<Link>? links;
    dynamic nextPageUrl;
    String? path;
    int? perPage;
    dynamic prevPageUrl;
    int? to;
    int? total;

    Data({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
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
    Blogger? blogger;
    Pivot? pivot;

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
        this.blogger,
        this.pivot,
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
        blogger: json["blogger"] == null ? null : Blogger.fromJson(json["blogger"]),
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
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
        "blogger": blogger?.toJson(),
        "pivot": pivot?.toJson(),
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

class Link {
    String? url;
    String? label;
    bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
