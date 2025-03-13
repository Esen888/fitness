// import 'package:fitness/features/user/data/models/total_user_courses_model.dart';
// import 'package:fitness/features/user/data/repository/get_users_total_courses_impl.dart';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'get_users_total_courses_event.dart';
// part 'get_users_total_courses_state.dart';

// class GetUsersTotalCoursesBloc
//     extends Bloc<GetUsersTotalCoursesEvent, GetUsersTotalCoursesState> {
//   GetUsersTotalCoursesRepoImpl repoImpl;
//   GetUsersTotalCoursesBloc({required this.repoImpl})
//       : super(GetUsersTotalCoursesInitial()) {
//     on<GetUsersTotalCoursesEvent>((event, emit) async {
//       emit(GetUsersTotalCoursesLoading());
//       try {
//         final result = await repoImpl.getUserCourses();
//         emit(GetUsersTotalCoursesSuccess(model: result));
//       } catch (_) {
//         emit(GetUsersTotalCoursesError());
//       }
//     });
//   }
// }
