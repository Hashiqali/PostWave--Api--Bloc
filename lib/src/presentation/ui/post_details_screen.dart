import 'package:flutter/material.dart';
import 'package:task_api/src/domain/entities/post_entities.dart';
import 'package:task_api/src/presentation/bloc/posts_bloc/posts_bloc.dart';

/// Screen displaying details of a single post.
class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key, required this.data, required this.bloc});

  final PostEntity data;
  final PostsBloc bloc;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            bloc.add(InitialEvent());
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Post Details',
          style: TextStyle(
            fontFamily: 'medium',
            color: Colors.white,
            fontSize: size.width / 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Title: \n',
                      style: TextStyle(
                        fontFamily: 'medium',
                        color: Colors.white,
                        fontSize: size.width / 20,
                      ),
                    ),
                    TextSpan(
                      text: data.title,
                      style: TextStyle(
                        fontFamily: 'regular',
                        color: Colors.blue,
                        fontSize: size.width / 29,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.width / 20),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Description: \n',
                      style: TextStyle(
                        fontFamily: 'medium',
                        color: Colors.white,
                        fontSize: size.width / 20,
                      ),
                    ),
                    TextSpan(
                      text: data.description,
                      style: TextStyle(
                        fontFamily: 'regular',
                        color: Colors.blue,
                        fontSize: size.width / 29,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
