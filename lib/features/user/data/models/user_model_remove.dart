import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String nickName;
  final String email;
  final String phoneNumber;
  final String password;

  UserModel({
    this.id,
    required this.nickName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  toJson() {
    return {
      "NickName": nickName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "Password": password,
    };
  }
factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    log("1111    ${document.data().toString()}");
    return UserModel(
      id: document.id,
      nickName: data["NickName"],
      email: data["Email"],
      phoneNumber: data["PhoneNumber"],
      password: data["Password"],
    );
  }

}
