import 'package:breaking_bad/data_layer/models/character.dart';
import 'package:breaking_bad/presentation_layer/shared/component/constants/constants.dart';
import 'package:dio/dio.dart';

class character_webServices {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: based_url,
      receiveDataWhenStatusError: true,
      // receiveTimeout: 60 * 1000,
      //connectTimeout: 60 * 1000,
    ));
  }

  static Future<List<dynamic>> all_character_details() async {
    try {
      Response response = await dio!.get('characters');

      if (response.statusCode == 200) {
        List<dynamic> allcharacters = response.data;
        return allcharacters;
      } else {
        print('${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('error when fetch data : ${error.toString()}');
      return [];
    }
  }
}
