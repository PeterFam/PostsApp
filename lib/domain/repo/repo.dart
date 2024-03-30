import 'package:dartz/dartz.dart';
import 'package:ninjaz_posts_app/domain/repo/base_repo.dart';

import '../../core/handle_error/exceptions.dart';
import '../../core/handle_error/failure.dart';
import '../../core/handle_error/network_info.dart';
import '../../data/model/post.dart';
import '../../data/remote/remote_data_source.dart';

class Repo extends BaseRepo {
  final RemoteData remoteData;
  final NetworkInfo networkInfo;
  Repo({required this.remoteData, required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getData(
      {required int pageNumber}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteData.getData(
            pageNumber: pageNumber);
        return Right(result);
      } on ServerException catch (failure) {
        return left(ServerFailure(message: failure.message.toString()));
      }
    } else {
      //get posts from database
      return left(const ServerFailure(message: 'No Internet Connection'));
    }
  }
}