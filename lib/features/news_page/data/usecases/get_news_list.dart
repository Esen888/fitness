import 'package:fitness/core/consts/url_routes.dart';
import 'package:fitness/features/news_page/data/models/news_list_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetNewsListUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  GetNewsListUseCase({required this.dio, required this.prefs});
  Future<NewsListModel> getNewsList() async {
    final Response response = await dio.get(UrlRoutes.listOfNews,
        options: Options(headers: {
          "Authorization": "Bearer ${prefs.getString("access_token")}"
        }));
    return NewsListModel.fromJson(response.data);
  }
}
