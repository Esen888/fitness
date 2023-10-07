import 'package:BodyPower/features/user/data/models/user_model.dart';
import 'package:BodyPower/features/user/domain/use_case/user_use_case.dart';
import 'package:bloc/bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase userUseCase;
  UserBloc({required this.userUseCase}) : super(UserInitial()) {
    on<GetUserEvent>((event, emit) {
      emit(UserLoadingState());
    });

    on<CreateUserEvent>((event, emit) {
      emit(UserLoadingState());
      userUseCase
          .createUser(event.userModel)
          .then((_) => emit(CreatedUserState()))
          .onError((error, stackTrace) => emit(UserErrorState(error.toString())));
    });
  }
}
