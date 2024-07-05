import 'package:task_api/src/data/datasource/remote_service.dart';
import 'package:task_api/src/data/models/post_model.dart';
import 'package:task_api/src/domain/repositories/post_repository.dart';

/// Implementation of the PostRepository interface using a remote service.
class IPostrepository implements PostRepository {
  final RemoteService _remoteService;

  IPostrepository(this._remoteService);

  /// Adds a new post using the remote service.
  @override
  Future<void> addpost(Map<String, dynamic> data) async {
    return await _remoteService.addPost(data);
  }

  /// Deletes a post by ID using the remote service.
  @override
  Future<void> deletepost(int id) {
    return _remoteService.deletePost(id);
  }

  /// Fetches all posts using the remote service.
  @override
  Future<List<PostModel>> getallpost() async {
    return await _remoteService.getPost();
  }

  /// Updates an existing post using the remote service.
  @override
  Future<void> updatepost(Map<String, dynamic> data) async {
    return await _remoteService.updatePost(data);
  }

  /// Fetches a single post by ID using the remote service.
  @override
  Future<PostModel> getSinglepost(int id) async {
    return await _remoteService.getsinglePost(id);
  }
}
