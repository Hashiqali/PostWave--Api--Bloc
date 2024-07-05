import 'package:task_api/src/data/models/user_model.dart';

abstract class RemoteService {
  /// Fetches a list of posts.
  Future<List<PostModel>> getPost();

  /// Fetches a single post by its [id].
  Future<PostModel> getsinglePost(int id);

  /// Adds a new post using [data].
  Future<void> addPost(Map<String, dynamic> data);

  /// Updates an existing post using [data].
  Future<void> updatePost(Map<String, dynamic> data);

  /// Deletes a post by its [id].
  Future<void> deletePost(int id);
}
