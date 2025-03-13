import 'package:fitness/features/user/data/models/user_model.dart';
import 'package:fitness/features/user/data/repository/get_user_info.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  GetUserInfoRepoImpl repoImpl;
  UserInfoBloc({required this.repoImpl}) : super(UserInfoInitial()) {
    on<UserInfoEvent>((event, emit) async {
      emit(UserInfoLoading());
      try {
        final result = await repoImpl.getUserInfo();
        emit(UserInfoSuccess(model: result));
      } on DioException catch (e) {
        emit(UserInfoError(exception: e));
      }
    });
  }
}
