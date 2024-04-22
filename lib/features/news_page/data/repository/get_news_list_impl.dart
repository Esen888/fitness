import 'package:BodyPower/features/news_page/data/models/news_list_model.dart';
import 'package:BodyPower/features/news_page/data/usecases/get_news_list.dart';
import 'package:BodyPower/features/news_page/domain/repositories/get_news_list.dart';

class GetNewsListRepoImpl implements GetNewsListRepo {
  GetNewsListUseCase useCase;
  GetNewsListRepoImpl({required this.useCase});
  @override
  Future<NewsListModel> getNewsList() async {
    return await useCase.getNewsList();
  }
}
