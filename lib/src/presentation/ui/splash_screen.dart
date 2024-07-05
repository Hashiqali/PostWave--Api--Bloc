import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_api/src/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:task_api/src/presentation/ui/home_screen.dart';
import 'package:task_api/src/presentation/widgets/no_network_widget.dart';

/// SplashScreen widget displays a loading screen with animation and navigates based on app state.
class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final homebloc = BlocProvider.of<PostsBloc>(context);
    homebloc.add(InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PostsBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<PostsBloc, PostsState>(
        listener: (context, state) {
          // Navigates to the HomeScreen if state indicates navigation is required,
// otherwise navigates to the NoNetworkWidget if there's a network error.
          if (state is NavigateToHomeState) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const HomeScreen()));
          } else if (state is NavigateToErrorNetworkState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (ctx) => NoNetworkWidget(
                bloc: bloc,
              ),
            ));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText(
                    'PostWave',
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'semibold',
                      fontSize: 40,
                    ),
                    duration: const Duration(milliseconds: 5000),
                  ),
                ],
                isRepeatingAnimation: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
