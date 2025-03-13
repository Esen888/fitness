import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class BloggerModel {
  final String? id;
  final String? bloggerCardImage;
  final String? bloggerCardName;
  final String? bloggerCourseName;

  BloggerModel({
    this.id,
    required this.bloggerCardImage,
    required this.bloggerCardName,
    required this.bloggerCourseName,
  });

  factory BloggerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    log("1111    ${document.data().toString()}");
    return BloggerModel(
      id: document.id,
      bloggerCardImage: data["BloggerCardImage"],
      bloggerCardName: data["BloggerCardName"],
      bloggerCourseName: data["BloggerCourseName"],
    );
  }
}

class ExerciseGroupCard {
  final String? id;
  final String? name;
  final String? picture;

  ExerciseGroupCard({
    this.id,
    required this.name,
    required this.picture,
  });

  factory ExerciseGroupCard.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    // final data = document.data()!;
    log("22222222    ${document.data().toString()}");
    return ExerciseGroupCard(
      name: document["Name"],
      picture: document["Picture"],
    );
  }
}

class Exercise {
  final String? id;
  final String? exerciseName;
  final String? info;
  final String? lottie;

  Exercise({
    this.id,
    required this.exerciseName,
    required this.info,
    required this.lottie,
  });

  factory Exercise.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    log("33333333    ${document.data().toString()}");
    return Exercise(
        exerciseName: data["ExerciseName"],
        info: data["Info"],
        lottie: data["Lottie"]);
  }
}


// To parse this JSON data, do
//
//     final bloggerModel = bloggerModelFromJson(jsonString);


// BloggerModel bloggerModelFromJson(String str) => BloggerModel.fromJson(json.decode(str));

// String bloggerModelToJson(BloggerModel data) => json.encode(data.toJson());

// class BloggerModel {
  
//     final String? bloggerCardName;
//     final ExerciseGroupCard? exerciseGroupCard;
//     final String? bloggerCourseName;
//     final String? bloggerCardImage;

//     BloggerModel({
//         required this.bloggerCardName,
//         required this.exerciseGroupCard,
//         required this.bloggerCourseName,
//         required this.bloggerCardImage,
//     });

//     factory BloggerModel.fromJson(Map<String, dynamic> json) => BloggerModel(
//         bloggerCardName: json["BloggerCardName"],
//         exerciseGroupCard: ExerciseGroupCard.fromJson(json["ExerciseGroupCard"]),
//         bloggerCourseName: json["BloggerCourseName"],
//         bloggerCardImage: json["BloggerCardImage"],
//     );

//     Map<String, dynamic> toJson() => {
//         "BloggerCardName": bloggerCardName,
//         "ExerciseGroupCard": exerciseGroupCard!.toJson(),
//         "BloggerCourseName": bloggerCourseName,
//         "BloggerCardImage": bloggerCardImage,
//     };
// }

// class ExerciseGroupCard {
//     final String? picture;
//     final List<Exercise>? exercises;
//     final String? name;

//     ExerciseGroupCard({
//         required this.picture,
//         required this.exercises,
//         required this.name,
//     });

//     factory ExerciseGroupCard.fromJson(Map<String, dynamic> json) => ExerciseGroupCard(
//         picture: json["Picture"],
//         exercises: List<Exercise>.from(json["Exercises"].map((x) => Exercise.fromJson(x))),
//         name: json["Name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "Picture": picture,
//         "Exercises": List<dynamic>.from(exercises!.map((x) => x.toJson())),
//         "Name": name,
//     };
// }

// class Exercise {
//     final String? info;
//     final String? lottie;
//     final String? exerciseName;

//     Exercise({
//         required this.info,
//         required this.lottie,
//         required this.exerciseName,
//     });

//     factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
//         info: json["Info"],
//         lottie: json["Lottie"],
//         exerciseName: json["ExerciseName"],
//     );

//     Map<String, dynamic> toJson() => {
//         "Info": info,
//         "Lottie": lottie,
//         "ExerciseName": exerciseName,
//     };
// }
