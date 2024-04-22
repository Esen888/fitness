import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class SignUpTextFieldCard extends StatefulWidget {
  const SignUpTextFieldCard({
    super.key,
    required this.phoneNumberController,
    required this.countryCode,
  });
  final TextEditingController phoneNumberController;
  final CountryCode countryCode;

  @override
  State<SignUpTextFieldCard> createState() => _SignUpTextFieldCardState();
}

class _SignUpTextFieldCardState extends State<SignUpTextFieldCard> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: widget.phoneNumberController,
      style: AppFonts.w700s18.copyWith(color: ColorHelper.greyD1D3D3),
      decoration: InputDecoration(
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        hintText: '777123123',
        suffixIcon: widget.phoneNumberController.text.length != 9
            ? const Icon(Icons.drive_file_rename_outline_outlined)
            : const Icon(Icons.check),
        suffixIconColor: ColorHelper.greyD1D3D3,
        filled: true,
        fillColor: ColorHelper.black38,
        prefixIcon: CountryCodePicker(
          favorite: ['+996', 'KG'],
          onChanged: (CountryCode countryCode) {
            setState(() {
              // widget.countryCode = countryCode;
            });
          },
          initialSelection: 'KG',
          textStyle: AppFonts.w700s18.copyWith(color: ColorHelper.greyD1D3D3),
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
          alignLeft: false,
        ),
      ),
      validator: (value) {
        if (value!.length != 9) {
          return 'Please enter valid phone number';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        setState(() {
          widget.phoneNumberController.text.isEmpty != true;
        });
      },
    );
  }
}
