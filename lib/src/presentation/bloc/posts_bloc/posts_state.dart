part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

/// Initial state when the application starts.
final class HomeInitial extends PostsState {}

/// Abstract base class for states related to actions.
abstract class ActionState extends PostsState {}

/// State representing navigation to add details screen.
class NavigateToaddDetailsState extends ActionState {
  final Map<String, dynamic> details;

  NavigateToaddDetailsState({required this.details});
}

/// State representing successful data retrieval with posts.
class SuccessState extends PostsState {
  final List<PostEntity> posts;

  SuccessState({required this.posts});
}

/// State representing loading state while fetching data.
class LoadingState extends PostsState {}

/// State representing successful addition of a post.
class SnackbaraddSuccessstate extends ActionState {}

/// State representing successful update of a post.
class SnackbarupdateSuccessstate extends ActionState {}

/// State representing successful deletion of a post.
class SnackbardeleteSuccessstate extends ActionState {}

/// State representing failure in performing an action.
class Snackbarfailstate extends ActionState {}

/// State representing navigation to details of a single post.
class NavigatesinglepostdetailsState extends PostsState {
  final PostEntity data;

  NavigatesinglepostdetailsState({required this.data});
}

/// State representing navigation back to the home screen.
class NavigateToHomeState extends ActionState {}

/// State representing navigation to an error screen due to network issues.
class NavigateToErrorNetworkState extends ActionState {}

/// State representing network loading state.
class NetworkloadingState extends PostsState {
  final bool istrue;

  NetworkloadingState({required this.istrue});
}
