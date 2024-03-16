import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ninjaz_posts_app/presentation/bloc/posts_bloc.dart';
import '../core/handle_error/network_info.dart';
import '../data/remote/remote_data_source.dart';
import '../domain/repo/base_repo.dart';
import '../domain/repo/repo.dart';
import '../domain/use_case/get_posts_data_usecase.dart';

final GetIt appServiceLocator = GetIt.instance;

class AppServiceLocator {
  static Future<void> initAppServiceLocator() async {

    appServiceLocator.registerFactory<PostsBloc>(
            () => PostsBloc(appServiceLocator()));

    appServiceLocator.registerLazySingleton<GetDataUseCase>(
            () => GetDataUseCase(baseRepo: appServiceLocator()));

    appServiceLocator.registerLazySingleton<BaseRepo>(() => Repo(
        networkInfo: appServiceLocator(), remoteData: appServiceLocator()));

    appServiceLocator.registerLazySingleton<RemoteData>(() => RemoteDataImpl());

    // Network information
    appServiceLocator.registerLazySingleton(() => InternetConnectionChecker());
    appServiceLocator.registerLazySingleton<NetworkInfo>(
            () => NetworkInfoImpl(appServiceLocator()));
  }
}