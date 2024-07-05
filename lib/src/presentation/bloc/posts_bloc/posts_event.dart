part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

/// Event triggered when details button is clicked.
class AddDetailsButtonClicked extends PostsEvent {
  final Map<String, dynamic> details;

  AddDetailsButtonClicked({required this.details});
}

/// Initial event to start loading posts.
class InitialEvent extends PostsEvent {}

/// Event triggered when adding a new post.
class AddPostEvent extends PostsEvent {
  final TextEditingController titlecontroller;
  final TextEditingController descriptioncontroller;
  final dynamic key;

  AddPostEvent({
    required this.titlecontroller,
    required this.descriptioncontroller,
    required this.key,
  });
}

/// Event triggered when updating an existing post.
class UpdatePostEvent extends PostsEvent {
  final TextEditingController titlecontroller;
  final TextEditingController descriptioncontroller;
  final dynamic key;

  UpdatePostEvent({
    required this.titlecontroller,
    required this.descriptioncontroller,
    required this.key,
  });
}

/// Event triggered when deleting a post.
class DeletePostEvent extends PostsEvent {
  final int id;

  DeletePostEvent({required this.id});
}

/// Event triggered when navigating to details of a single post.
class NavigatesinglepostdetailsEvent extends PostsEvent {
  final int id;

  NavigatesinglepostdetailsEvent({required this.id});
}

/// Event triggered for network loading state.
class NetworkloadingEvent extends PostsEvent {
  final bool istrue;

  NetworkloadingEvent({required this.istrue});
}
