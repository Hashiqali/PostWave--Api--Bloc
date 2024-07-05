import 'package:task_api/src/domain/entities/post_entities.dart';

class PostModel extends PostEntity {
  PostModel(
      {required super.id, required super.title, required super.description});

  // Factory constructor to create an instance from JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'], title: json['title'], description: json['body']);
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': description};
  }
}
