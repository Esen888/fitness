import 'package:fitness/core/consts/url_routes.dart';
import 'package:fitness/features/blogger/data/models/section_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class   GetSectionsListUseCase{
 final Dio dio;
 final SharedPreferences prefs;
 GetSectionsListUseCase({required this.dio, required this.prefs});
 Future<SectionsModel> getSectionsList()async{
  final Response response = await dio.get(UrlRoutes.listOfSections, options: Options(
    headers: {
      "Authorization":"Bearer ${prefs.getString("access_token")}"
    }
  ));
  return SectionsModel.fromJson(response.data);
 }
}