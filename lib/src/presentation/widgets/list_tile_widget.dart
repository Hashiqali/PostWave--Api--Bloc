import 'package:flutter/material.dart';
import 'package:task_api/src/domain/entities/post_entities.dart';
import 'package:task_api/src/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:task_api/src/presentation/widgets/delete_dialogue_widget.dart';

/// Widget for displaying a list of posts as ListTile items.
class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.size,
    required this.bloc,
    required this.posts,
  });

  final Size size;
  final PostsBloc bloc;
  final List<PostEntity> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (ctx, index) {
        final data = posts[index];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.white, width: .6),
            ),
            child: ListTile(
              trailing: PopupMenuButton<String>(
                color: const Color.fromARGB(255, 31, 31, 31),
                onSelected: (value) {
                  if (value == 'edit') {
                    final value = {
                      'id': data.id,
                      'title': data.title,
                      'description': data.description
                    };
                    bloc.add(AddDetailsButtonClicked(details: value));
                  } else if (value == 'delete') {
                    deleteDialogue(
                      context: context,
                      size: size,
                      id: data.id,
                      bloc: bloc,
                    );
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontFamily: 'medium',
                          color: Colors.white,
                          fontSize: size.width / 30,
                        ),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          fontFamily: 'medium',
                          color: Colors.white,
                          fontSize: size.width / 30,
                        ),
                      ),
                    ),
                  ];
                },
              ),
              title: Column(
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
                            fontSize: size.width / 25,
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Description: \n',
                          style: TextStyle(
                            fontFamily: 'medium',
                            color: Colors.white,
                            fontSize: size.width / 25,
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
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              onTap: () {
                bloc.add(NavigatesinglepostdetailsEvent(id: data.id));
              },
            ),
          ),
        );
      },
    );
  }
}
