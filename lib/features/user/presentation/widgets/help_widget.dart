import 'package:fitness/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class HelpWidget extends StatelessWidget {
  final Function onTap;
  const HelpWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Row(
        children: [
          const Icon(
            Icons.question_mark_rounded,
            size: 10,
            color: Color(0xff55BA30),
          ),
          Text(
            "Помощь",
            style: AppFonts.w500s10.copyWith(color: const Color(0xff55BA30)),
          )
        ],
      ),
    );
  }
}
