import 'package:dio/dio.dart';
import 'package:ninjaz_posts_app/shared/component/constants.dart';

class DioHelper{
  static Dio? dio;

  static init(){
    dio = Dio(BaseOptions(
      baseUrl: Constants.baseUrl,
      receiveDataWhenStatusError: true
    ));
  }

  Future<Response> getData({required String url}) async {
    dio!.options.headers = {
      "app-id": Constants.apiKey
    };
    return await dio!.get(url);
  }
}