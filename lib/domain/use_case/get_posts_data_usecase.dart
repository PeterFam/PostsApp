import 'package:dartz/dartz.dart';

import '../../core/handle_error/failure.dart';
import '../../data/model/post.dart';
import '../repo/base_repo.dart';

class GetDataUseCase {
  final BaseRepo baseRepo;

  GetDataUseCase({required this.baseRepo});

  Future<Either<Failure, List<Post>>> call(
      {required int pageNumber}) async {
    return await baseRepo.getData(
        pageNumber: pageNumber);
  }
}