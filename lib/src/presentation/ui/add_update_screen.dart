import 'package:flutter/material.dart';
import 'package:task_api/src/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:task_api/src/presentation/widgets/form_widget.dart';

/// Screen for adding and editing a post.
class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key, required this.bloc, required this.details});

  /// Details of the post to be edited, if any.
  final Map<String, dynamic> details;

  /// BLoC instance managing post-related logic.
  final PostsBloc bloc;

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final GlobalKey addkey = GlobalKey<FormState>();

  @override
  void initState() {
    // Populate fields if editing existing post
    if (widget.details.isNotEmpty) {
      titlecontroller.text = widget.details['title'];
      descriptioncontroller.text = widget.details['description'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Trigger initial event to refresh posts after adding/editing
            widget.bloc.add(InitialEvent());
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.details.isEmpty ? 'Add Post' : 'Edit Post',
          style: TextStyle(
            fontFamily: 'regular',
            color: Colors.white,
            fontSize: size.width / 20,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: FormWidget(
        addkey: addkey,
        bloc: widget.bloc,
        descriptioncontroller: descriptioncontroller,
        details: widget.details,
        size: size,
        titlecontroller: titlecontroller,
      ),
    );
  }
}
