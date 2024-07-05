/// Entity representing a post with an ID, title, and description.
class PostEntity {
  final int id;
  final String title;
  final String description;

  /// Constructs a [PostEntity] with the given [id], [title], and [description].
  PostEntity({
    required this.id,
    required this.title,
    required this.description,
  });
}
