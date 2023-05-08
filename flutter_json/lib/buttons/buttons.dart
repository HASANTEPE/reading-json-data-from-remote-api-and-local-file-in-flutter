import 'package:flutter/material.dart';

import 'package:flutter_json/local_data/local_json.dart';
import 'package:flutter_json/local_data/test.dart';
import 'package:flutter_json/views/comment_view.dart';
import 'package:flutter_json/views/photos_view.dart';

import '../views/users_view.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: buttonMethod(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LocalJson(),
            ),
          );
        }, "Local Json")),
        buttonMethod(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TestWidget(),
            ),
          );
        }, "Test"),
        buttonMethod(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CommentsView(),
            ),
          );
        }, "Comment"),
        buttonMethod(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UsersView(),
            ),
          );
        }, "Dio Library"),
        buttonMethod(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PhotosView(),
            ),
          );
        }, "Model Widget"),
      ],
    );
  }

  ElevatedButton buttonMethod(onPressed, String text) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
