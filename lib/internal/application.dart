import 'package:BodyPower/config/dependency_injection/locator.dart';
import 'package:BodyPower/core/network/dio_settings.dart';
import 'package:BodyPower/features/achievement_screen/data/repositories/get_weights_repo_impl.dart';
import 'package:BodyPower/features/achievement_screen/data/repositories/save_weight_repo_impl.dart';
import 'package:BodyPower/features/achievement_screen/data/usecase/get_weights_usecase.dart';
import 'package:BodyPower/features/achievement_screen/data/usecase/save_weight_usecase.dart';
import 'package:BodyPower/features/achievement_screen/presentation/blocs/get_weights_list_bloc/get_weights_bloc.dart';
import 'package:BodyPower/features/achievement_screen/presentation/blocs/save_weight_bloc/save_weight_bloc.dart';
import 'package:BodyPower/features/blogger/data/repository/buy_course_impl.dart';
import 'package:BodyPower/features/blogger/data/repository/courses_for_guests_impl.dart';
import 'package:BodyPower/features/blogger/data/repository/get_list_all_availablecourses_repo_impl.dart';
import 'package:BodyPower/features/blogger/data/repository/get_list_of_courses_in_section_impl.dart';
import 'package:BodyPower/features/blogger/data/repository/get_sections_list_repo.dart';
import 'package:BodyPower/features/blogger/data/repository/get_trial_version_impl.dart';
import 'package:BodyPower/features/blogger/data/use_cases/buy_course_usecase.dart';
import 'package:BodyPower/features/blogger/data/use_cases/courses_for_guests.dart';
import 'package:BodyPower/features/blogger/data/use_cases/get_all_available_courses.dart';
import 'package:BodyPower/features/blogger/data/use_cases/get_list_of_courses_in_section_usecase.dart';
import 'package:BodyPower/features/blogger/data/use_cases/get_sections_list_usecase.dart';
import 'package:BodyPower/features/blogger/data/use_cases/get_trial_version.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/all_courses_bloc/all_courses_bloc.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/buy_course_bloc/buy_course_bloc.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/get_courses_for_guests_bloc/get_courses_for_guests_bloc.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/get_list_of_courses_in_section_bloc/get_list_of_courses_in_section_bloc.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/get_sections_list/get_list_of_sections_bloc.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/get_trial_version_bloc/get_trial_version_bloc.dart';
import 'package:BodyPower/features/blogger/presentation/provider/change_gender_provider.dart';
import 'package:BodyPower/features/blogger/presentation/provider/default_course_index.dart';
import 'package:BodyPower/features/news_page/data/repository/get_news_list_impl.dart';
import 'package:BodyPower/features/news_page/data/usecases/get_news_list.dart';
import 'package:BodyPower/features/news_page/presentation/blocs/news_list_bloc/news_list_bloc.dart';
import 'package:BodyPower/features/splash_screen/splash_screen.dart';
import 'package:BodyPower/features/user/data/data_sources/authorization_usecase.dart';
import 'package:BodyPower/features/user/data/data_sources/courses_usecase.dart';
import 'package:BodyPower/features/user/data/data_sources/get_total_usercources_usecase.dart';
import 'package:BodyPower/features/user/data/data_sources/get_user_info_usecase.dart';
import 'package:BodyPower/features/user/data/data_sources/login_usecase.dart';
import 'package:BodyPower/features/user/data/data_sources/logout_usecase.dart';
import 'package:BodyPower/features/user/data/data_sources/user_courses_usecase.dart';
import 'package:BodyPower/features/user/data/repository/authorization_repo_impl.dart';
import 'package:BodyPower/features/user/data/repository/course_repo_impl.dart';
import 'package:BodyPower/features/user/data/repository/get_total_usercourses_impl.dart';
import 'package:BodyPower/features/user/data/repository/get_user_info.dart';
import 'package:BodyPower/features/user/data/repository/login_repo_impl.dart';
import 'package:BodyPower/features/user/data/repository/logout_repo_impl.dart';
import 'package:BodyPower/features/user/data/repository/user_courses_repo_impl.dart';
import 'package:BodyPower/features/user/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:BodyPower/features/user/presentation/blocs/cource_bloc/cource_bloc.dart';
import 'package:BodyPower/features/user/presentation/blocs/get_user_courses_bloc/get_user_courses_bloc.dart';
import 'package:BodyPower/features/user/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:BodyPower/features/user/presentation/blocs/logout_bloc/log_out_bloc.dart';
import 'package:BodyPower/features/user/presentation/blocs/total_courses_bloc/get_total_user_courses_bloc.dart';
import 'package:BodyPower/features/user/presentation/blocs/user_info_bloc/user_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../core/utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => DioSettings()),
            RepositoryProvider(
                create: (context) => SharedPreferencesRepository()),
            RepositoryProvider(
                create: (context) => LoginUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                            context)
                        .prefs)),
            RepositoryProvider(
                create: (context) => LoginRepositoryImpl(
                    useCase: RepositoryProvider.of<LoginUseCase>(context))),
            RepositoryProvider(
                create: (context) => GetSectionsListUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                            context)
                        .prefs)),
            RepositoryProvider(
                create: (context) => GetSectionsListRepoImpl(
                    useCase: RepositoryProvider.of<GetSectionsListUseCase>(
                        context))),
            RepositoryProvider(
                create: (context) => GetListOfCoursesInSectionUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                            context)
                        .prefs)),
            RepositoryProvider(
                create: (context) => GetListOfCoursesInSectionRepoImpl(
                    useCase:
                        RepositoryProvider.of<GetListOfCoursesInSectionUseCase>(
                            context))),
            RepositoryProvider(
                create: (context) => GetUserInfoUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                            context)
                        .prefs)),
            RepositoryProvider(
                create: (context) => GetUserInfoRepoImpl(
                    useCase:
                        RepositoryProvider.of<GetUserInfoUseCase>(context))),
            RepositoryProvider(
                create: (context) => GetNewsListUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                            context)
                        .prefs)),
            RepositoryProvider(
                create: (context) => GetNewsListRepoImpl(
                    useCase:
                        RepositoryProvider.of<GetNewsListUseCase>(context))),
            RepositoryProvider(
                create: (context) => AuthorizationUseCase(
                      dio: RepositoryProvider.of<DioSettings>(context).dio,
                    )),
            RepositoryProvider(
                create: (context) => AuthorizationRepoImpl(
                    useCase:
                        RepositoryProvider.of<AuthorizationUseCase>(context))),
            RepositoryProvider(
                create: (context) => LogOutUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                            context)
                        .prefs)),
            RepositoryProvider(
                create: (context) => LogOutRepoImpl(
                    useCase: RepositoryProvider.of<LogOutUseCase>(context))),
            RepositoryProvider(
                create: (context) => SaveWeightUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                            context)
                        .prefs)),
            RepositoryProvider(
                create: (context) => SaveWeightRepoImpl(
                    useCase:
                        RepositoryProvider.of<SaveWeightUseCase>(context))),
            RepositoryProvider(
                create: (context) => GetWeightsUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                            context)
                        .prefs)),
            RepositoryProvider(
                create: (context) => GetWeightsRepoImpl(
                    useCase:
                        RepositoryProvider.of<GetWeightsUseCase>(context))),
            RepositoryProvider(
                create: (context) => GetAllAvailableCoursesUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                            context)
                        .prefs)),
            RepositoryProvider(
                create: (context) => GetAllAvailableCoursesRepoImpl(
                    useCase:
                        RepositoryProvider.of<GetAllAvailableCoursesUseCase>(
                            context))),
            RepositoryProvider(
                create: (context) => UserCourseUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    preferences:
                        RepositoryProvider.of<SharedPreferencesRepository>(
                                context)
                            .prefs)),
            RepositoryProvider(
                create: (context) => UserCoursesRepoImpl(
                    useCase:
                        RepositoryProvider.of<UserCourseUseCase>(context))),
            RepositoryProvider(
                create: (context) => GetTrialVersionUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                            context)
                        .prefs)),
            RepositoryProvider(
                create: (context) => GetTrialVersionRepoImpl(
                    useCase: RepositoryProvider.of<GetTrialVersionUseCase>(
                        context))),
            RepositoryProvider(
                create: (context) => TotalUserCoursesUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                            context)
                        .prefs)),
            RepositoryProvider(
                create: (context) => TotalUserCoursesRepoImpl(
                    useCase: RepositoryProvider.of<TotalUserCoursesUseCase>(
                        context))),
            RepositoryProvider(
                create: (context) => GetCoursesForGuestsUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio)),
            RepositoryProvider(
                create: (context) => GetCoursesForGuestRepoImpl(
                    useCase: RepositoryProvider.of<GetCoursesForGuestsUseCase>(
                        context))),
            RepositoryProvider(
                create: (context) => BuyCourseUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                            context)
                        .prefs)),
            RepositoryProvider(
                create: (context) => BuyCourseRepoImpl(
                    useCase: RepositoryProvider.of<BuyCourseUseCase>(context))),
            RepositoryProvider(
                create: (context) => CoursesUseCase(
                    dio: RepositoryProvider.of<DioSettings>(context).dio,
                    preferences:
                        RepositoryProvider.of<SharedPreferencesRepository>(
                                context)
                            .prefs)),
            RepositoryProvider(
                create: (context) => CourceRepoImpl(
                    useCase: RepositoryProvider.of<CoursesUseCase>(context)))
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => LoginBloc(
                      repositoryImpl:
                          RepositoryProvider.of<LoginRepositoryImpl>(context))),
              BlocProvider(
                  create: (context) => GetListOfSectionsBloc(
                      repoImpl: RepositoryProvider.of<GetSectionsListRepoImpl>(
                          context))),
              BlocProvider(
                  create: (context) => GetListOfCoursesInSectionBloc(
                      repoImpl: RepositoryProvider.of<
                          GetListOfCoursesInSectionRepoImpl>(context))),
              BlocProvider(
                  create: (context) => UserInfoBloc(
                      repoImpl:
                          RepositoryProvider.of<GetUserInfoRepoImpl>(context))),
              BlocProvider(
                  create: (context) => NewsListBloc(
                      repoImpl:
                          RepositoryProvider.of<GetNewsListRepoImpl>(context))),
              BlocProvider(
                  create: (context) => AuthorizationBloc(
                      repoImpl: RepositoryProvider.of<AuthorizationRepoImpl>(
                          context))),
              BlocProvider(
                  create: (context) => LogOutBloc(
                      repoImpl:
                          RepositoryProvider.of<LogOutRepoImpl>(context))),
              BlocProvider(
                  create: (context) => SaveWeightBloc(
                      repoImpl:
                          RepositoryProvider.of<SaveWeightRepoImpl>(context))),
              BlocProvider(
                  create: (context) => GetWeightsBloc(
                      repoImpl:
                          RepositoryProvider.of<GetWeightsRepoImpl>(context))),
              BlocProvider(
                  create: (context) => AllCoursesBloc(
                      repoImpl:
                          RepositoryProvider.of<GetAllAvailableCoursesRepoImpl>(
                              context))),
              BlocProvider(
                  create: (context) => GetUserCoursesBloc(
                      repoImpl:
                          RepositoryProvider.of<UserCoursesRepoImpl>(context))),
              BlocProvider(
                  create: (context) => GetTrialVersionBloc(
                      repoImpl: RepositoryProvider.of<GetTrialVersionRepoImpl>(
                          context))),
              BlocProvider(
                  create: (context) => GetTotalUserCoursesBloc(
                      repoImpl: RepositoryProvider.of<TotalUserCoursesRepoImpl>(
                          context))),
              BlocProvider(
                  create: (context) => GetCoursesForGuestsBloc(
                      repoImpl:
                          RepositoryProvider.of<GetCoursesForGuestRepoImpl>(
                              context))),
              BlocProvider(
                  create: (context) => BuyCourseBloc(
                      repoImpl:
                          RepositoryProvider.of<BuyCourseRepoImpl>(context))),
              BlocProvider(
                  create: (context) => CourceBloc(
                      repoImpl: RepositoryProvider.of<CourceRepoImpl>(context)))
            ],
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                    create: (context) => ChangeGenderProvider(
                        prefs:
                            RepositoryProvider.of<SharedPreferencesRepository>(
                                    context)
                                .prefs)),
                ChangeNotifierProvider(
                    create: (context) => DefaultCourseIndexProvider())
              ],
              child: ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                splitScreenMode: true,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    applyElevationOverlayColor: true,
                    scaffoldBackgroundColor: ColorHelper.defaultThemeColor,
                    primarySwatch: Colors.blue,
                    elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r)),
                          backgroundColor: ColorHelper.buttonColor),
                    ),
                  ),
                  home: const SplashScreen(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
