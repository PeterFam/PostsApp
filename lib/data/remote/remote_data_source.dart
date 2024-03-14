import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ninjaz_posts_app/core/component/constants.dart';

import '../../core/handle_error/exceptions.dart';
import '../model/post.dart';

abstract class RemoteData {
  Future<List<Post>> getData(
      {required int pageNumber});
}

class RemoteDataImpl extends RemoteData {
  Dio? dio;
  RemoteDataImpl(){
    dio = Dio(BaseOptions(
        baseUrl: Constants.baseUrl,
        receiveDataWhenStatusError: true
    ));
  }


  @override
  Future<List<Post>> getData({
    required int pageNumber}) async {
    dio?.options.headers = {
      "app-id": Constants.apiKey
    };
    final response = await dio!.get(Constants.postsUrl+pageNumber.toString());
    try {
      List<Post> postList = (response.data['data'] as List)
          .map((data) => Post.fromJson(data))
          .toList();
      print(postList.toString());
      return postList;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}