import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:isar/isar.dart';
import 'package:ninjaz_posts_app/data/local/model/isar_post.dart';
import 'package:ninjaz_posts_app/data/local/repository/isar_post_repo.dart';
import 'package:ninjaz_posts_app/presentation/bloc/posts_bloc.dart';
import 'package:path_provider/path_provider.dart';
import '../core/handle_error/network_info.dart';
import '../data/remote/remote_data_source.dart';
import '../domain/repo/base_repo.dart';
import '../domain/repo/repo.dart';
import '../domain/use_case/get_posts_data_usecase.dart';

final GetIt appServiceLocator = GetIt.instance;

class AppServiceLocator {
  static Future<void> initAppServiceLocator() async {
    final dir = await getApplicationDocumentsDirectory();

    //open Isar db
    final isarDB = await Isar.open([PostIsarSchema], directory: dir.path);

    //initialize the repo with Isar db

    appServiceLocator.registerFactory<PostsBloc>(
            () => PostsBloc(appServiceLocator()));

    appServiceLocator.registerLazySingleton<GetDataUseCase>(
            () => GetDataUseCase(baseRepo: appServiceLocator()));

    appServiceLocator.registerLazySingleton<IsarPostRepo>(
        () => IsarPostRepo(isarDB)
    );

    appServiceLocator.registerLazySingleton<BaseRepo>(() => Repo(
        networkInfo: appServiceLocator(), remoteData: appServiceLocator(), postRepo: appServiceLocator()));

    appServiceLocator.registerLazySingleton<RemoteData>(() => RemoteDataImpl());

    // Network information
    appServiceLocator.registerLazySingleton(() => InternetConnectionChecker());
    appServiceLocator.registerLazySingleton<NetworkInfo>(
            () => NetworkInfoImpl(appServiceLocator()));
  }
}