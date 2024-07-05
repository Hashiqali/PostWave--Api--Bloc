import 'package:task_api/src/domain/entities/post_entities.dart';
import 'package:task_api/src/domain/repositories/post_repository.dart';

/// Class responsible for fetching details of a single post through the repository.
class Getsinglepostdetails {
  final PostRepository _postRepository;

  /// Constructs a [Getsinglepostdetails] instance with a [PostRepository].
  Getsinglepostdetails(this._postRepository);

  /// Executes the operation to fetch a single post by [id] using the injected [PostRepository].
  Future<PostEntity> exicute(int id) async {
    return await _postRepository.getSinglepost(id);
  }
}
