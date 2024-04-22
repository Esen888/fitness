import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:BodyPower/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.bodypower).existsSync(), isTrue);
    expect(File(Images.back).existsSync(), isTrue);
    expect(File(Images.backScreen).existsSync(), isTrue);
    expect(File(Images.barbellIcon).existsSync(), isTrue);
    expect(File(Images.baseTraining).existsSync(), isTrue);
    expect(File(Images.blackScreen).existsSync(), isTrue);
    expect(File(Images.bloggerImage).existsSync(), isTrue);
    expect(File(Images.defaultGender).existsSync(), isTrue);
    expect(File(Images.female).existsSync(), isTrue);
    expect(File(Images.flag).existsSync(), isTrue);
    expect(File(Images.legs).existsSync(), isTrue);
    expect(File(Images.loginPicture).existsSync(), isTrue);
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.logo1111).existsSync(), isTrue);
    expect(File(Images.male).existsSync(), isTrue);
    expect(File(Images.myCourseImage).existsSync(), isTrue);
    expect(File(Images.noPain).existsSync(), isTrue);
    expect(File(Images.profileAvatar).existsSync(), isTrue);
    expect(File(Images.shoulders).existsSync(), isTrue);
    expect(File(Images.splash).existsSync(), isTrue);
    expect(File(Images.training11).existsSync(), isTrue);
    expect(File(Images.training22).existsSync(), isTrue);
    expect(File(Images.training33).existsSync(), isTrue);
    expect(File(Images.youngFitness).existsSync(), isTrue);
  });
}
