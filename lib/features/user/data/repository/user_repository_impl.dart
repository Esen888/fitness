import 'dart:developer';

import 'package:BodyPower/features/user/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final _db = FirebaseFirestore.instance;


  @override
  createUser(UserModel user) async {
    try {
      await _db.collection("User").add(user.toJson()).whenComplete(() {
        log("Succes. Your account has been created ");
      }

          // Get.snackbar(
          //       "Succes",
          //       "You account has been created",
          //       snackPosition: SnackPosition.BOTTOM,
          //       backgroundColor: Colors.green.withOpacity(0.1),
          //       colorText: Colors.green,
          //     )
          );
    } catch (e) {
      log("CreateUser Error   ${e.toString()}");
      // Get.snackbar(
      //   "Error",
      //   "try again",
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.redAccent.withOpacity(0.1),
      //   colorText: Colors.red,
      // );
    }
  }
  
  @override
  Future<List<UserModel>> getUserDetail() async{
     try {
      final snapshot = await _db.collection("User").get();

      List<UserModel> userData = [];
      for (var element in snapshot.docs) {
        log(element.data().toString());

        // log(element.get("ExerciseGroupCard"));
        userData.add(UserModel.fromSnapshot(element));
      }
      // snapshot.docs.map((e) {
      //   log(e.data().toString());
      // });
      return userData;
    } catch (e) {
      log("ERRRORR    Getting all user   ${e.toString()}");
      throw e;
    }
  }
}
