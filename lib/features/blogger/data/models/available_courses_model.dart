// To parse this JSON data, do
//
//     final availableCoursesModel = availableCoursesModelFromJson(jsonString);

import 'dart:convert';

AvailableCoursesModel availableCoursesModelFromJson(String str) => AvailableCoursesModel.fromJson(json.decode(str));

String availableCoursesModelToJson(AvailableCoursesModel data) => json.encode(data.toJson());

class AvailableCoursesModel {
    String? status;
    Data? data;

    AvailableCoursesModel({
        this.status,
        this.data,
    });

    factory AvailableCoursesModel.fromJson(Map<String, dynamic> json) => AvailableCoursesModel(
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
    DateTime? createdAt;
    DateTime? updatedAt;
    int? price;
    String? description;
    bool? attached;
    bool? isFree;
    String? imageUrl;
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
        this.blogger,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        bloggerId: json["blogger_id"],
        image: json["image"],
        name: json["name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        price: json["price"],
        description: json["description"],
        attached: json["attached"],
        isFree: json["is_free"],
        imageUrl: json["image_url"],
        blogger: json["blogger"] == null ? null : Blogger.fromJson(json["blogger"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "blogger_id": bloggerId,
        "image": image,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "price": price,
        "description": description,
        "attached": attached,
        "is_free": isFree,
        "image_url": imageUrl,
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
