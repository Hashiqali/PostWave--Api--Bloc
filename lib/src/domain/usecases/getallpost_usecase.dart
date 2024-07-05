import 'package:task_api/src/domain/entities/post_entities.dart';
import 'package:task_api/src/domain/repositories/post_repository.dart';

/// Class responsible for fetching post details through the repository.
class Getpostdetails {
  final PostRepository _postRepository;

  /// Constructs a [Getpostdetails] instance with a [PostRepository].
  Getpostdetails(this._postRepository);

  /// Executes the operation to fetch all posts using the injected [PostRepository].
  Future<List<PostEntity>> exicute() async {
    return await _postRepository.getallpost();
  }
}
