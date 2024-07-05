import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:task_api/di.dart';
import 'package:task_api/src/domain/repositories/post_repository.dart';
import 'package:task_api/src/domain/usecases/addpost_usecase.dart';
import 'package:task_api/src/domain/usecases/deletepost_usecase.dart';
import 'package:task_api/src/domain/usecases/getallpost_usecase.dart';
import 'package:task_api/src/domain/usecases/getsinglepost_usecase.dart';
import 'package:task_api/src/domain/usecases/updatepost_usecase.dart';
import 'package:task_api/src/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:task_api/src/presentation/ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection setup
  final dependencyInjection = DependecyInjection();
  dependencyInjection.setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide the PostsBloc to the entire app
      create: (context) => PostsBloc(
        // Inject dependencies into the PostsBloc constructor
        getsinglepostdetails:
            Getsinglepostdetails(GetIt.instance<PostRepository>()),
        updatepostdetails: Updatepostdetails(GetIt.instance<PostRepository>()),
        deletepostdetails: Deletepostdetails(GetIt.instance<PostRepository>()),
        addpostdetailsusecase: Addpostdetails(GetIt.instance<PostRepository>()),
        getpostdetailsusecase: Getpostdetails(GetIt.instance<PostRepository>()),
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
