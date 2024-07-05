import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_api/src/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:task_api/src/presentation/ui/add_update_screen.dart';
import 'package:task_api/src/presentation/ui/post_details_screen.dart';
import 'package:task_api/src/presentation/widgets/list_tile_widget.dart';
import 'package:task_api/src/presentation/widgets/snackbar_widget.dart';

/// Home screen displaying a list of posts and handling navigation and actions.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PostsBloc>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Posts',
          style: TextStyle(
            fontFamily: 'regular',
            color: Colors.white,
            fontSize: size.width / 20,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        listener: (context, state) {
          // Navigate to add or edit post screen
          if (state is NavigateToaddDetailsState) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => AddPostScreen(
                details: state.details,
                bloc: bloc,
              ),
            ));
          }
          // Show success snackbar on delete post success
          else if (state is SnackbardeleteSuccessstate) {
            snackbarSucess(context, 'Success');
          }
          // Navigate to post details screen
          else if (state is NavigatesinglepostdetailsState) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => PostDetailsScreen(
                data: state.data,
                bloc: bloc,
              ),
            ));
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (state is SuccessState) {
            return ListTileWidget(
              posts: state.posts,
              bloc: bloc,
              size: size,
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(139, 158, 158, 158),
        onPressed: () {
          bloc.add(AddDetailsButtonClicked(details: const {}));
        },
        child: Icon(
          color: Colors.white,
          Icons.add_box,
          size: size.width / 11,
        ),
      ),
    );
  }
}
