import 'package:task_api/src/domain/repositories/post_repository.dart';

/// Class responsible for deleting posts through the repository.
class Deletepostdetails {
  final PostRepository _postRepository;

  /// Constructs a [Deletepostdetails] instance with a [PostRepository].
  Deletepostdetails(this._postRepository);

  /// Deletes a post with the specified [id] using the injected [PostRepository].
  Future<void> deletePost(int id) async {
    return await _postRepository.deletepost(id);
  }
}
