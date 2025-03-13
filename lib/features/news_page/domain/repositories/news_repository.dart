import '../../data/models/news_page_models.dart';

abstract class NewsRepository {
  Future<NewsModel> getNewsDetails(String id);
  Future<List<NewsModel>> allNews();
}
