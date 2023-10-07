import 'package:flutter/material.dart';

bool isDarkMode = true;

class ColorHelper {
  static Color splashBackgroundColor =
      isDarkMode ? const Color(0xff191919) : const Color(0xff74B55D);
  static Color splashIconColor =
      isDarkMode ? const Color(0xff90E072) : const Color(0xffFFFFFF);
  static Color authenticationIconColor =
      isDarkMode ? const Color(0xff474747) : const Color(0xffCCCCCC);
  static Color backgroundColor =
      isDarkMode ? const Color(0xff191919) : const Color(0xffEFEFEF);
  static Color defaultThemeColor =
      isDarkMode ? const Color(0xffE1E1E1) : const Color(0xff101010);
  static Color exerciseNameDefaultColor =
      isDarkMode ? const Color(0xffFFFFFF) : const Color(0xff101010);
  static Color newsCardColor =
      isDarkMode ? const Color(0xff2F2F2F) : const Color(0xffD9D9D9);
  static Color cardsBackground =
      isDarkMode ? const Color(0xff2F2F2F) : const Color(0xffE1E1E1);
  static Color approachCardBack =
      isDarkMode ? const Color(0xff3F3F3F) : const Color(0xff90E072);
  static Color selectExerciseDropDownBack =
      isDarkMode ? const Color(0xff2B2B2B) : const Color(0xffE1E1E1);
  static Color buttonColor =
      isDarkMode ? const Color(0xff90E072) : const Color(0xff101010);
  static Color buttonTextColor =
      isDarkMode ? const Color(0xff101010) : const Color(0xffFFFFFF);

  static Color blue01DDEB = const Color(0xff01DDEB);
  static Color green90E072 = const Color(0xff90E072);
  static Color greyD1D3D3 = const Color(0xffD1D3D3);
  static Color black000000 = const Color(0xff000000);
  static Color whiteECECEC = const Color(0xffECECEC);
  static Color white10 = Colors.white10;
  static Color blackwithopacity01 = Colors.black.withOpacity(0.1);
  static Color black38 = Colors.black38;
  static Color black101010 = const Color(0xff101010);
  static Color grey878787 = const Color(0xff878787);
  static Color whiteFFFFFFWithopacity05 =
      const Color(0xffFFFFFF).withOpacity(0.5);
  static Color weightTextFieldBorder = const Color(0xffD9D9D9);
  static Color weightTextFieldIcon = const Color(0xff55BA30);
  static Color weightTextFieldText = const Color(0xff929292);
  static Color alwaysGrey929292 = const Color(0xff929292);
  static Color alwaysGreyColor = const Color(0xffE1E1E1);
  static Color alwaysWhiteFFFFFF = const Color(0xffFFFFFF);
  static Color trainingTypeColor = const Color(0xff90E072);
  static Color trainingTypeTextColor = const Color(0xff397D20);
  static Color unAthenticatedText = const Color(0xffBBFFA3);
  static Color countryCodeText = const Color(0xff606060);
  static Color newsTimeColor = const Color(0xff777777);
  static Color phoneNumberColor = const Color(0xff777777);
  static Color exercisesListColor = const Color(0xff707070);
  static Color recommendedTime = const Color(0xff707070);
  static Color inviteFriendColor = const Color(0xff707070);
  static Color generalIconColor = const Color(0xff55BA30);
  static Color logOutIcon = const Color(0xffFF0000);
  static Color healthAndSafetyIcon = const Color(0xff00B2FF);
}
