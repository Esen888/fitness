// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'dart:convert';

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
    String? status;
    Data? data;

    PaymentModel({
        this.status,
        this.data,
    });

    factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    String? url;

    Data({
        this.url,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}
