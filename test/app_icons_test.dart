import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:BodyPower/resources/resources.dart';

void main() {
  test('app_icons assets test', () {
    expect(File(AppIcons.achievementsIcon).existsSync(), isTrue);
    expect(File(AppIcons.bodyPowerIcon).existsSync(), isTrue);
    expect(File(AppIcons.charger).existsSync(), isTrue);
    expect(File(AppIcons.coursesIcon).existsSync(), isTrue);
    expect(File(AppIcons.female).existsSync(), isTrue);
    expect(File(AppIcons.go).existsSync(), isTrue);
    expect(File(AppIcons.googleIcon).existsSync(), isTrue);
    expect(File(AppIcons.healthAndSafety).existsSync(), isTrue);
    expect(File(AppIcons.homeIcon).existsSync(), isTrue);
    expect(File(AppIcons.icLauncherBackground).existsSync(), isTrue);
    expect(File(AppIcons.icLauncherForeground).existsSync(), isTrue);
    expect(File(AppIcons.language).existsSync(), isTrue);
    expect(File(AppIcons.logout).existsSync(), isTrue);
    expect(File(AppIcons.male).existsSync(), isTrue);
    expect(File(AppIcons.moon).existsSync(), isTrue);
    expect(File(AppIcons.newsIcon).existsSync(), isTrue);
    expect(File(AppIcons.nutrition).existsSync(), isTrue);
    expect(File(AppIcons.privatness).existsSync(), isTrue);
    expect(File(AppIcons.profile).existsSync(), isTrue);
    expect(File(AppIcons.remove).existsSync(), isTrue);
    expect(File(AppIcons.sport).existsSync(), isTrue);
    expect(File(AppIcons.star).existsSync(), isTrue);
    expect(File(AppIcons.statistic).existsSync(), isTrue);
  });
}
