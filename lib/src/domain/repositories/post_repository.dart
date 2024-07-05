import 'package:task_api/src/data/models/post_model.dart';

/// Repository interface for handling post-related operations.
abstract interface class PostRepository {
  /// Fetches all posts.
  Future<List<PostModel>> getallpost();

  /// Fetches a single post by ID.
  Future<PostModel> getSinglepost(int id);

  /// Adds a new post.
  Future<void> addpost(Map<String, dynamic> data);

  /// Updates an existing post.
  Future<void> updatepost(Map<String, dynamic> data);

  /// Deletes a post by ID.
  Future<void> deletepost(int id);
}
