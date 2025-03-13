import 'dart:developer';

import 'package:fitness/features/news_page/data/models/news_page_models.dart';
import 'package:fitness/features/news_page/domain/repositories/news_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewRepositoryImpl implements NewsRepository {
  final _db = FirebaseFirestore.instance;

  @override
  Future<List<NewsModel>> allNews() async {
    try {
      final snapshot = await _db.collection("News").get();
      final newsData =
          snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
      return newsData;
    } catch (e) {
      log("ERROR  getting allNews   ${e.toString()}");
      throw e;
    }
  }

  @override
  Future<NewsModel> getNewsDetails(String id) async {
    try {
      final snapshot =
          await _db.collection("News").where("id", isEqualTo: id).get();
      final newsData =
          snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).single;
      return newsData;
    } catch (e) {
      log("Error getNewsDetails  ${e.toString()}");
      throw e;
    }
  }
}
