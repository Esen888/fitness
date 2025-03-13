part of 'news_list_bloc.dart';

class NewsListState extends Equatable {
  const NewsListState();

  @override
  List<Object> get props => [];
}

class NewsListInitial extends NewsListState {}

class NewsListLoading extends NewsListState {}

class NewsListSuccess extends NewsListState {
  final NewsListModel model;
  const NewsListSuccess({required this.model});
}

class NewsListError extends NewsListState {
  final DioException exception;
  const NewsListError({required this.exception});
}
