import 'package:BodyPower/features/news_page/data/models/news_list_model.dart';
import 'package:BodyPower/features/news_page/data/repository/get_news_list_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'news_list_event.dart';
part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  GetNewsListRepoImpl repoImpl;
  NewsListBloc({required this.repoImpl}) : super(NewsListInitial()) {
    on<NewsListEvent>((event, emit) async {
      emit(NewsListLoading());
      try {
        final NewsListModel result = await repoImpl.getNewsList();
        emit(NewsListSuccess(model: result));
      } on DioException catch (e) {
        emit(NewsListError(exception: e));
      }
    });
  }
}
