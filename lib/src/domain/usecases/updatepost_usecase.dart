import 'package:task_api/src/domain/repositories/post_repository.dart';

/// Class responsible for updating posts through the repository.
class Updatepostdetails {
  final PostRepository _postRepository;

  /// Constructs an [Updatepostdetails] instance with a [PostRepository].
  Updatepostdetails(this._postRepository);

  /// Updates a post using the injected [PostRepository].
  Future<void> updatepost(Map<String, dynamic> data) async {
    return await _postRepository.updatepost(data);
  }
}
