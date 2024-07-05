import 'package:get_it/get_it.dart';
import 'package:task_api/src/data/datasource/remote.dart';
import 'package:task_api/src/data/repositories/post_repository.dart';
import 'package:task_api/src/domain/repositories/post_repository.dart';
import 'package:task_api/src/domain/usecases/addpost_usecase.dart';
import 'package:task_api/src/domain/usecases/deletepost_usecase.dart';
import 'package:task_api/src/domain/usecases/getallpost_usecase.dart';
import 'package:task_api/src/domain/usecases/getsinglepost_usecase.dart';
import 'package:task_api/src/domain/usecases/updatepost_usecase.dart';

/// Manages dependency injection setup using GetIt for post-related functionality.
class DependecyInjection {
  final _getIt = GetIt.instance;

  /// Sets up singleton instances of repositories and use cases.
  void setupDependencies() {
    _getIt
      ..registerLazySingleton<PostRepository>(
          () => IPostrepository(PostApiService()))
      ..registerLazySingleton<Addpostdetails>(
          () => Addpostdetails(GetIt.instance<PostRepository>()))
      ..registerLazySingleton<Deletepostdetails>(
          () => Deletepostdetails(GetIt.instance<PostRepository>()))
      ..registerLazySingleton<Getpostdetails>(
          () => Getpostdetails(GetIt.instance<PostRepository>()))
      ..registerLazySingleton<Updatepostdetails>(
          () => Updatepostdetails(GetIt.instance<PostRepository>()))
      ..registerLazySingleton<Getsinglepostdetails>(
          () => Getsinglepostdetails(GetIt.instance<PostRepository>()));
  }
}
