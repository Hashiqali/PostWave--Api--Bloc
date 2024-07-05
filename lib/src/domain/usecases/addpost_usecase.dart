import 'package:task_api/src/domain/repositories/post_repository.dart';

/// Class responsible for adding details to the repository.
class Addpostdetails {
  final PostRepository _postRepository;

  /// Constructs an [Addpostdetails] instance with a [PostRepository].
  Addpostdetails(this._postRepository);

  /// Adds details to the repository using the injected [PostRepository].
  Future<void> addDetails({required Map<String, dynamic> data}) async {
    return await _postRepository.addpost(data);
  }
}
