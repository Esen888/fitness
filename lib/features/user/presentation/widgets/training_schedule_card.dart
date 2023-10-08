import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:BodyPower/features/user/presentation/logic/video_cubit/video_cubit.dart';
import 'package:BodyPower/features/user/presentation/screens/video_screen.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';

class TrainingScheduleCard extends StatefulWidget {
  const TrainingScheduleCard({
    Key? key,
    required this.dayOfTheWeek,
  }) : super(key: key);
  final String dayOfTheWeek;

  @override
  State<TrainingScheduleCard> createState() => _TrainingScheduleCardState();
}

class _TrainingScheduleCardState extends State<TrainingScheduleCard> {
  var _borderRadiusTop = const Radius.circular(0);
  var _borderRadiusBottom = const Radius.circular(0);
  @override
  void initState() {
    BlocProvider.of<VideoCubit>(context)
        .getVideos(dayOfTheWeek: widget.dayOfTheWeek);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<VideoCubit, VideoState>(
          listener: (context, state) {
            if (state is VideoFinishSuccessState) {
              Future.delayed(const Duration(milliseconds: 500)).then((value) {
                BlocProvider.of<VideoCubit>(context)
                    .getVideos(dayOfTheWeek: widget.dayOfTheWeek);
              });
            }
          },
          builder: (context, state) {
            if (state is VideoLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state is VideoErrorState) {
              return Text(state.error.toString());
            }
            if (state is VideoSuccessState) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.data.length,
                  padding: EdgeInsets.only(top: 8.h),
                  itemBuilder: (context, index) {
                    _borderRadiusTop = Radius.circular(index == 0 ? 16 : 0);
                    _borderRadiusBottom = Radius.circular(
                      state.data.length >= 2
                          ? index == state.data.length - 1
                              ? 16
                              : 0
                          : 0,
                    );
                    return InkWell(
                      borderRadius: BorderRadius.only(
                          topLeft: _borderRadiusTop,
                          topRight: _borderRadiusTop,
                          bottomLeft: _borderRadiusBottom,
                          bottomRight: _borderRadiusBottom),
                      highlightColor: Colors.transparent,
                      onTap: !(state.data[index].isAvailable ?? true)
                          ? null
                          : () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoScreen(
                                          model: state.data[index],
                                          index: index,
                                          dayOfTheWeek: widget.dayOfTheWeek,
                                          mediaUrl:
                                              state.data[index].mediaUrl)));
                            },
                      child: Ink(
                        width: 343.w,
                        height: 76.h,
                        padding: EdgeInsets.only(top: 13.h),
                        decoration: BoxDecoration(
                          border: state.data[index].isWatched ?? false
                              ? Border.all(color: ColorHelper.trainingTypeColor)
                              : null,
                          borderRadius: BorderRadius.only(
                              topLeft: _borderRadiusTop,
                              topRight: _borderRadiusTop,
                              bottomLeft: _borderRadiusBottom,
                              bottomRight: _borderRadiusBottom),
                          image: DecorationImage(
                            opacity: state.data[index].isAvailable ?? false
                                ? 0.5
                                : 0.3,
                            image: NetworkImage(
                                state.data[index].imageVideo ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            state.data[index].isAvailable ?? false
                                ? state.data[index].videoName ?? ''
                                : 'Видео недоступно',
                            style: TextHelper.w500s16.copyWith(
                                color: state.data[index].isAvailable ?? false
                                    ? ColorHelper.alwaysWhiteFFFFFF
                                    : ColorHelper.grey878787),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
