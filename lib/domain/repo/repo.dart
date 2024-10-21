import 'package:dartz/dartz.dart';
import 'package:ninjaz_posts_app/data/local/repository/isar_post_repo.dart';
import 'package:ninjaz_posts_app/domain/repo/base_repo.dart';

import '../../core/handle_error/exceptions.dart';
import '../../core/handle_error/failure.dart';
import '../../core/handle_error/network_info.dart';
import '../../data/model/post.dart';
import '../../data/remote/remote_data_source.dart';

class Repo extends BaseRepo {
  final RemoteData remoteData;
  final NetworkInfo networkInfo;
  final IsarPostRepo postRepo;

  Repo({required this.remoteData, required this.networkInfo, required this.postRepo});

  @override
  Future<Either<Failure, List<Post>>> getData(
      {required int pageNumber}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteData.getData(
            pageNumber: pageNumber);
        for (var post in result) {
        await postRepo.addPost(post);
        print(post);
        }
        return Right(result);
      } on ServerException catch (failure) {
        return left(ServerFailure(message: failure.message.toString()));
      }
    } else {

     final postsList = await postRepo.getPostsList();
      if(postsList.isNotEmpty){
        //get posts from database
          return Right(postsList);

      }else {
        return left(const ServerFailure(message: 'No Internet Connection'));
      }

    }
  }
}