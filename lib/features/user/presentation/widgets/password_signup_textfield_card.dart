import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';

class PasswordSignUpTextFieldCard extends StatefulWidget {
  const PasswordSignUpTextFieldCard({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<PasswordSignUpTextFieldCard> createState() =>
      _PasswordSignUpTextFieldCardState();
}

class _PasswordSignUpTextFieldCardState
    extends State<PasswordSignUpTextFieldCard> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppFonts.w700s20.copyWith(color: ColorHelper.greyD1D3D3),
      controller: widget.controller,
      obscureText: _obscureText,
      onChanged: (value) {
        setState(() {
          widget.controller.text.isEmpty != true;
        });
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            }),
        suffixIconColor: ColorHelper.greyD1D3D3,
        filled: true,
        fillColor: ColorHelper.black38,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 2,
            color: ColorHelper.white10,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 2,
            color: ColorHelper.blue01DDEB,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Пожалуйста введите ваш пароль';
        }
        return null;
      },
    );
  }
}
