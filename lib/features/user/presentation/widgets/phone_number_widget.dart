// import 'package:fitness/features/user/presentation/widgets/signup_button_card.dart';
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/app_fonts.dart';

// class PhoneNumberWidget extends StatefulWidget {
//   final TextEditingController phoneNumberController;
//   const PhoneNumberWidget({
//     super.key,
//     required this.phoneNumberController,
//   });

//   @override
//   State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
// }

// class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   CountryCode _countryCode = CountryCode(code: 'KG', dialCode: '+996');
//   // String initialCountry = 'KG';
//   PhoneNumber number = PhoneNumber(isoCode: 'KG');

//   void getPhoneNumber(String phoneNumber, String isCode) async {
//     PhoneNumber number =
//         await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'KG');

//     setState(() {
//       this.number = number;
//     });
//   }

//   @override
//   void dispose() {
//     // widget.phoneNumberController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             width: 222.w,
//             height: 32.h,
//             child: TextFormField(
//               keyboardType: TextInputType.phone,
//               controller: widget.phoneNumberController,
//               style: AppFonts.w700s18.copyWith(color: ColorHelper.greyD1D3D3),
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide(
//                     width: 2,
//                     color: ColorHelper.white10,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide(
//                     width: 2,
//                     color: ColorHelper.blue01DDEB,
//                   ),
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(
//                     width: 2,
//                     color: Colors.red,
//                   ),
//                 ),
//                 filled: true,
//                 fillColor: ColorHelper.alwaysGreyColor,
//                 prefixIcon: CountryCodePicker(
//                   padding: EdgeInsets.zero,
//                   favorite: const ['+996', 'KG'],
//                   onChanged: (CountryCode countryCode) {
//                     setState(() {
//                       _countryCode = countryCode;
//                     });
//                   },
//                   initialSelection: 'KG',
//                   textStyle: AppFonts.w500s12
//                       .copyWith(color: ColorHelper.countryCodeText),
//                   showCountryOnly: false,
//                   showOnlyCountryWhenClosed: false,
//                   alignLeft: false,
//                 ),
//               ),
//               // validator: (value) {
//               //   if (value!.length == 0) {
//               //     return 'Please enter valid phone number';
//               //   }
//               //   return null;
//               // },
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               onChanged: (value) {
//                 setState(() {
//                   widget.phoneNumberController.text.isEmpty != true;
//                 });
//               },
//             ),
//           ),
//           // SignUpTextFieldCard(
//           //   phoneNumberController: widget.phoneNumberController,
//           //   countryCode: countryCode,
//           // ),
//           // InternationalPhoneNumberInput(
//           //   onInputChanged: (PhoneNumber number) {
//           //     print(number.phoneNumber);
//           //   },
//           //   onInputValidated: (bool value) {
//           //     print(value);
//           //   },
//           //   selectorConfig: SelectorConfig(
//           //     countryComparator: (p0, p1) {
//           //       return 0;
//           //     },
//           //     setSelectorButtonAsPrefixIcon: true,
//           //     leadingPadding: 15.w,
//           //     selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//           //   ),
//           //   ignoreBlank: false,
//           //   autoValidateMode: AutovalidateMode.disabled,
//           //   selectorTextStyle:
//           //       TextHelper.w700s18.copyWith(color: ColorHelper.greyD1D3D3),
//           //   initialValue: number,
//           //   textFieldController: widget.phoneNumberController,
//           //   formatInput: true,
//           //   keyboardType: const TextInputType.numberWithOptions(
//           //       signed: true, decimal: true),
//           //   inputBorder: OutlineInputBorder(
//           //     borderRadius: BorderRadius.circular(15),
//           //     borderSide: BorderSide(
//           //       width: 2,
//           //       color: ColorHelper.white10,
//           //     ),
//           //   ),
//           //   inputDecoration: InputDecoration(
//           //     enabledBorder: OutlineInputBorder(
//           //       borderRadius: BorderRadius.circular(15),
//           //       borderSide: BorderSide(
//           //         width: 2,
//           //         color: ColorHelper.white10,
//           //       ),
//           //     ),
//           //     focusedBorder: OutlineInputBorder(
//           //       borderRadius: BorderRadius.circular(15),
//           //       borderSide: BorderSide(
//           //         width: 2,
//           //         color: ColorHelper.blue01DDEB,
//           //       ),
//           //     ),
//           //     border: OutlineInputBorder(
//           //       borderRadius: BorderRadius.circular(15),
//           //       borderSide: const BorderSide(
//           //         width: 2,
//           //         color: Colors.red,
//           //       ),
//           //     ),
//           //     hintStyle: TextHelper.w700s15
//           //         .copyWith(color: ColorHelper.greyD1D3D3.withOpacity(0.8)),
//           //     suffixIcon: widget.phoneNumberController.text.length == 0
//           //         ? const Icon(Icons.drive_file_rename_outline_outlined)
//           //         : const Icon(Icons.check),
//           //     suffixIconColor: ColorHelper.greyD1D3D3,
//           //     filled: true,
//           //     fillColor: ColorHelper.black38,
//           //   ),
//           //   onSaved: (PhoneNumber number) {
//           //     print('On Saved: $number');
//           //   },
//           // ),
//           // ElevatedButton(
//           //   onPressed: () {
//           //     formKey.currentState?.validate();
//           //   },
//           //   child: Text('Validate'),
//           // ),

//           Padding(
//             padding: EdgeInsets.only(top: 16.h),
//             child: SendOtpButton(
//               phoneNumberController: widget.phoneNumberController,
//               countryCode: _countryCode,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
