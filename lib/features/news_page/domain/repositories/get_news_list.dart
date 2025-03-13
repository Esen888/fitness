import 'package:fitness/features/news_page/data/models/news_list_model.dart';

abstract class GetNewsListRepo {
  Future<NewsListModel> getNewsList();
}
