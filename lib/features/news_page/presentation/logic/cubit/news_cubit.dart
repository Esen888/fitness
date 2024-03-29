import 'package:BodyPower/features/news_page/data/models/news_page_models.dart';
import 'package:BodyPower/features/news_page/domain/use_case/news_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsUseCase newsUseCase;
  NewsCubit({required this.newsUseCase}) : super(NewsInitial());

  Future<void> getNewsList() async {
    emit(NewsLoadingState());
    await newsUseCase
        .allNews()
        .then((newsModel) => emit(FetchedNewsState(newsModel)))
        .onError((error, stackTrace) => emit(ErrorState(error.toString())));
  }

  Future<void> getNewsDetails(String id) async {
    emit(NewsLoadingState());
    await newsUseCase
        .getNewsDetails(id)
        .then((newsDetails) => emit(FetchedNewsDetailsState(newsDetails)))
        .onError((error, stackTrace) => emit(ErrorState(error.toString())));
  }
}
