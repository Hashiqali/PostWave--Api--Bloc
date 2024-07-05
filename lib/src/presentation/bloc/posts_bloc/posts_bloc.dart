import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:task_api/src/domain/entities/post_entities.dart';
import 'package:task_api/src/domain/usecases/addpost_usecase.dart';
import 'package:task_api/src/domain/usecases/deletepost_usecase.dart';
import 'package:task_api/src/domain/usecases/getallpost_usecase.dart';
import 'package:task_api/src/domain/usecases/getsinglepost_usecase.dart';
import 'package:task_api/src/domain/usecases/updatepost_usecase.dart';
part 'posts_event.dart';
part 'posts_state.dart';

/// BLoC class responsible for managing state related to posts.
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final Getpostdetails getpostdetailsusecase;
  final Addpostdetails addpostdetailsusecase;
  final Deletepostdetails deletepostdetails;
  final Updatepostdetails updatepostdetails;
  final Getsinglepostdetails getsinglepostdetails;

  PostsBloc({
    required this.getpostdetailsusecase,
    required this.getsinglepostdetails,
    required this.updatepostdetails,
    required this.deletepostdetails,
    required this.addpostdetailsusecase,
  }) : super(HomeInitial()) {
    on<InitialEvent>(initialEvent);
    on<AddDetailsButtonClicked>(addDetailsButtonClicked);
    on<AddPostEvent>(addPostEvent);
    on<UpdatePostEvent>(updatePostEvent);
    on<DeletePostEvent>(deletePostEvent);
    on<NavigatesinglepostdetailsEvent>(navigatesinglepostdetailsEvent);
    on<NetworkloadingEvent>(networkloadingEvent);
  }

  /// Handles the initial event to load posts or show network error.
  Future<void> initialEvent(
      InitialEvent event, Emitter<PostsState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(milliseconds: 3000));
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(NavigateToErrorNetworkState());
    } else {
      List<PostEntity> values = await getpostdetailsusecase.exicute();
      emit(NavigateToHomeState());
      emit(SuccessState(posts: values));
    }
  }

  /// Handles the event when details button is clicked.
  FutureOr<void> addDetailsButtonClicked(
      AddDetailsButtonClicked event, Emitter<PostsState> emit) {
    emit(NavigateToaddDetailsState(details: event.details));
  }

  /// Handles the event when a new post is added.
  FutureOr<void> addPostEvent(AddPostEvent event, Emitter<PostsState> emit) {
    if (event.key.currentState!.validate()) {
      final data = {
        "userId": 1,
        "id": 100,
        "title": event.titlecontroller.text.trim(),
        "body": event.descriptioncontroller.text.trim(),
      };
      addpostdetailsusecase.addDetails(data: data);
      emit(SnackbaraddSuccessstate());
    } else {
      emit(Snackbarfailstate());
    }
  }

  /// Handles the event when a post is updated.
  FutureOr<void> updatePostEvent(
      UpdatePostEvent event, Emitter<PostsState> emit) {
    if (event.key.currentState!.validate()) {
      final data = {
        "userId": 1,
        "id": 100,
        "title": event.titlecontroller.text.trim(),
        "body": event.descriptioncontroller.text.trim(),
      };
      updatepostdetails.updatepost(data);
      emit(SnackbarupdateSuccessstate());
    } else {
      emit(Snackbarfailstate());
    }
  }

  /// Handles the event when a post is deleted.
  FutureOr<void> deletePostEvent(
      DeletePostEvent event, Emitter<PostsState> emit) {
    deletepostdetails.deletePost(event.id);
    emit(SnackbardeleteSuccessstate());
  }

  /// Handles the event when navigating to details of a single post.
  FutureOr<void> navigatesinglepostdetailsEvent(
      NavigatesinglepostdetailsEvent event, Emitter<PostsState> emit) async {
    PostEntity value = await getsinglepostdetails.exicute(event.id);
    emit(NavigatesinglepostdetailsState(data: value));
  }

  /// Handles the event related to network loading state.
  FutureOr<void> networkloadingEvent(
      NetworkloadingEvent event, Emitter<PostsState> emit) async {
    emit(NetworkloadingState(istrue: true));
    await Future.delayed(const Duration(seconds: 5));
    emit(NetworkloadingState(istrue: false));
  }
}
