import 'package:BodyPower/config/dependency_injection/locator.dart';
import 'package:BodyPower/features/news_page/presentation/blocs/news_list_bloc/news_list_bloc.dart';
import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/news_card.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  SharedPreferences preferences = locator<SharedPreferences>();
  @override
  void initState() {
    getNews(context);
    super.initState();
  }

  void getNews(context) {
    BlocProvider.of<NewsListBloc>(context).add(const NewsListEvent());
  }

  @override
  Widget build(BuildContext context) {
    // bool isAuthorized = preferences.getString("access_token") != null;
    return Padding(
      padding: EdgeInsets.only(
        right: 16.w,
        left: 16.w,
        top: 12.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Новости",
                style: AppFonts.w700s20
                    .copyWith(color: ColorHelper.defaultThemeColor),
              ),
              const Spacer(),
              // Icon(
              //   Icons.favorite_outline,
              //   size: 24.r,
              //   color: ColorHelper.defaultThemeColor,
              // )
            ],
          ),
        
            BlocBuilder<NewsListBloc, NewsListState>(
                  builder: (context, state) {
                    if (state is NewsListLoading) {
                      const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (state is NewsListSuccess) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.model.data?.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: NewsCard(
                                dateWhenCreated: state.model.data?.data?[index].createdAt??DateTime(2024),
                                bloggersName:
                                    state.model.data?.data?[index].title ?? "",
                                newsLabel:
                                    state.model.data?.data?[index].title ?? "",
                                newsPhoto:
                                    state.model.data?.data?[index].imageUrl ??
                                        "",
                                bloggersAvatar:
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpuQEmtS-NUih_p0zUKzAzYcwvURARCSP53B_tAKoAvg&s",
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                )
              // : const Center(
              //     child: GraphicCard(
              //       error: 'Вы не вошли в аккаунт',
              //       emodji: '🙃',
              //     ),
              //   )
        ],
      ),
    );
  }
}
