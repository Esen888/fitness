import 'dart:developer';

import 'package:fitness/features/blogger/data/models/blogger_model.dart';
import 'package:fitness/features/blogger/domain/repositories/blogger_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BloggerRepositoryImpl implements BloggerRepository {
  final _db = FirebaseFirestore.instance;

  @override
  Future<List<BloggerModel>> getAllBloggers() async {
    try {
      final snapshot = await _db.collection("Bloggers").get();

      List<BloggerModel> bloggerData = [];
      for (var element in snapshot.docs) {
        log(element.data().toString());

        // log(element.get("ExerciseGroupCard"));
        bloggerData.add(BloggerModel.fromSnapshot(element));
      }
      // snapshot.docs.map((e) {
      //   log(e.data().toString());
      // });
      return bloggerData;
    } catch (e) {
      log("ERRRORR    Getting all blogers   ${e.toString()}");
      throw e;
    }
  }

  @override
  Future<ExerciseGroupCard> getExerciseCard(String id) async {
    try {
      final snapshot = await _db
          .collection("Bloggers")
          .doc(id)
          .collection('ExerciseGroupCard')
          .get()
          .whenComplete(() {
        log("Getting ExerciseGroupCard === Done ===");
      });
      final exerciseGroupCard =
          snapshot.docs.map((e) => ExerciseGroupCard.fromSnapshot(e)).single;
      return exerciseGroupCard;
    } catch (e) {
      log("ERROR    Exercisecard  ${e.toString()}");
      throw e;
    }
  }
}
 // Future<void> updateUserRecord(BloggerModel blogger) async {
  //   await _db.collection("Bloggers").doc(blogger.id).update(blogger.toJson());
  // }

  // createUser(UserModel user) async {
  //   try {
  //     await _db
  //         .collection("User")
  //         .add(user.toJson())
  //         .whenComplete(() => Get.snackbar(
  //               "Succes",
  //               "You account has been created",
  //               snackPosition: SnackPosition.BOTTOM,
  //               backgroundColor: Colors.green.withOpacity(0.1),
  //               colorText: Colors.green,
  //             ));
  //   } catch (e) {
  //     Get.snackbar(
  //       "Error",
  //       "try ----again",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.redAccent.withOpacity(0.1),
  //       colorText: Colors.red,
  //     );
  //     print("ERROR ---------${e.toString()}");
  //   }
  //   ;
  // }