import 'package:flutter/material.dart';
import 'package:task_api/src/presentation/bloc/posts_bloc/posts_bloc.dart';

/// Shows a confirmation dialog for deleting a post.
deleteDialogue({
  required BuildContext context,
  required Size size,
  required int id,
  required PostsBloc bloc,
}) {
  return showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        content: Text(
          'Are you sure you want to delete ?',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'dex2',
            fontSize: size.width / 30,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              bloc.add(DeletePostEvent(id: id)); // Trigger delete event
              Navigator.of(ctx).pop(); // Close the dialog
              bloc.add(InitialEvent()); // Refresh posts
            },
            child: Text(
              'Yes',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'dex2',
                fontSize: size.width / 28,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(); // Close the dialog without any action
            },
            child: Text(
              'No',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'dex2',
                fontSize: size.width / 28,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.all(10),
      );
    },
  );
}
