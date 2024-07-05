import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_api/src/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:task_api/src/presentation/widgets/snackbar_widget.dart';

/// Widget for displaying a form to add or update a post.
class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.addkey,
    required this.size,
    required this.titlecontroller,
    required this.descriptioncontroller,
    required this.details,
    required this.bloc,
  });

  final GlobalKey<State<StatefulWidget>> addkey;
  final Size size;
  final TextEditingController titlecontroller;
  final TextEditingController descriptioncontroller;
  final Map<String, dynamic> details;
  final PostsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: addkey,
      child: ListView(padding: const EdgeInsets.all(20), children: [
        TextFormField(
          style: TextStyle(
            fontFamily: 'regular',
            color: Colors.blue,
            fontSize: size.width / 24,
          ),
          cursorColor: Colors.white,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please add a title';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            labelText: 'Title',
            labelStyle: TextStyle(
              fontFamily: 'regular',
              color: Colors.white,
              fontSize: size.width / 30,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          controller: titlecontroller,
        ),
        SizedBox(
          height: size.height / 70,
        ),
        TextFormField(
          style: TextStyle(
            fontFamily: 'regular',
            color: Colors.blue,
            fontSize: size.width / 24,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please add a description';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            labelText: 'Description',
            labelStyle: TextStyle(
              fontFamily: 'regular',
              color: Colors.white,
              fontSize: size.width / 30,
            ),
          ),
          keyboardType: TextInputType.multiline,
          minLines: 5,
          maxLines: 8,
          controller: descriptioncontroller,
        ),
        SizedBox(
          height: size.height / 40,
        ),
        BlocListener<PostsBloc, PostsState>(
          listener: (context, state) {
            if (state is SnackbaraddSuccessstate) {
              snackbarSucess(context, 'Success');
              bloc.add(InitialEvent());
              Navigator.pop(context);
            } else if (state is SnackbarupdateSuccessstate) {
              snackbarSucess(context, 'Success');
              bloc.add(InitialEvent());
              Navigator.pop(context);
            } else if (state is Snackbarfailstate) {
              snackbarFail(context, 'Please fill the details');
            }
          },
          child: ElevatedButton(
            onPressed: () {
              details.isEmpty
                  ? bloc.add(AddPostEvent(
                      titlecontroller: titlecontroller,
                      descriptioncontroller: descriptioncontroller,
                      key: addkey,
                    ))
                  : bloc.add(UpdatePostEvent(
                      titlecontroller: titlecontroller,
                      descriptioncontroller: descriptioncontroller,
                      key: addkey,
                    ));
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              'Submit',
              style: TextStyle(
                fontFamily: 'semibold',
                color: Colors.black,
                fontSize: size.width / 30,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
