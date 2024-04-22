import 'package:BodyPower/core/utils/app_colors.dart';
import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:BodyPower/features/blogger/presentation/provider/change_gender_provider.dart';
import 'package:BodyPower/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeGenderButton extends StatefulWidget {
  final Function onTap;
  const ChangeGenderButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ChangeGenderButton> createState() => _ChangeGenderButtonState();
}

class _ChangeGenderButtonState extends State<ChangeGenderButton> {
  List<String> list = <String>[
    "Общие",
    'Для мужчин',
    'Для женщин',
  ];

  late String dropdownValue;
  @override
  void initState() {
    dropdownValue = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorHelper.buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      height: 27.h, // Increased height to accommodate the hint text
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          alignment: Alignment.center,
          value: dropdownValue,
          dropdownColor: ColorHelper.buttonColor,
          icon: const ImageIcon(
            AssetImage(AppIcons.go),
            size: 10,
          ),
          elevation: 16,
          style: AppFonts.w500s12.copyWith(color: const Color(0xff101010)),
          onChanged: (String? value) {
            setState(() {
              context.read<ChangeGenderProvider>().changeGender(result: value!);

              dropdownValue = value;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: AppFonts.w400s11
                    .copyWith(color: ColorHelper.buttonTextColor),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
