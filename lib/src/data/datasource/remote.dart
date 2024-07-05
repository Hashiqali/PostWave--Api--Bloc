import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:task_api/src/data/datasource/remote_service.dart';
import 'package:task_api/src/data/models/user_model.dart';

class PostApiService implements RemoteService {
  final baseurl = 'https://jsonplaceholder.typicode.com';

  /// Adds a new post to the remote server.
  @override
  Future<void> addPost(Map<String, dynamic> data) async {
    try {
      Uri uri = Uri.parse('$baseurl/posts');
      final response = await http.post(
        uri,
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        print('Add post statuscode == ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  /// Deletes a post from the remote server by its [id].
  @override
  Future<void> deletePost(int id) async {
    try {
      Uri uri = Uri.parse('$baseurl/posts/$id');
      final response = await http.delete(uri);
      print('Delete post statuscode == ${response.statusCode}');
    } catch (e) {
      log(e.toString());
    }
  }

  /// Retrieves a list of posts from the remote server.
  @override
  Future<List<PostModel>> getPost() async {
    List<PostModel> posts = [];
    try {
      Uri uri = Uri.parse('$baseurl/posts');
      final response = await http.get(uri);
      final List<dynamic> jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        posts = jsonData.map((json) => PostModel.fromJson(json)).toList();
        print('Get post statuscode == ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }

    return posts;
  }

  /// Updates an existing post on the remote server using the provided [data].
  @override
  Future<void> updatePost(Map<String, dynamic> data) async {
    try {
      Uri uri = Uri.parse('$baseurl/posts/${data['id']}');
      final response = await http.put(uri, body: jsonEncode(data));
      print('Update post statuscode == ${response.statusCode}');
    } catch (e) {
      log(e.toString());
    }
  }

  /// Retrieves a single post from the remote server by its [id].
  @override
  Future<PostModel> getsinglePost(int id) async {
    PostModel post =
        PostModel(id: 0, title: 'title', description: 'description');
    try {
      Uri uri = Uri.parse('$baseurl/posts/$id');
      final response = await http.get(uri);
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        post = PostModel.fromJson(data);
        print('Get single post statuscode == ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
    return post;
  }
}
