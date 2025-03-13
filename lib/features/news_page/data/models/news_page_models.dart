import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  final String? id;
  final String newsImage;
  final String newsName;
  final String newsInfo;

  NewsModel({
    this.id,
    required this.newsImage,
    required this.newsName,
    required this.newsInfo,
  });
  toJson() {
    return {
      "NewsImage": newsImage,
      "NewsName": newsName,
      "NewsInfo": newsInfo,
    };
  }

  factory NewsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return NewsModel(
      id: document.id,
      newsImage: data["NewsImage"],
      newsName: data["NewsName"],
      newsInfo: data["NewsInfo"],
    );
  }
}
