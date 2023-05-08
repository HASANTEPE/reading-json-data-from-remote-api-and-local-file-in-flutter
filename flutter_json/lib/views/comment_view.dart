import 'package:flutter/material.dart';

import '../models/comment_model.dart';
import '../services/services.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: dataFutureBuilder(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: const Text("Comment Page"),
    );
  }

  FutureBuilder<List<CommentModel>> dataFutureBuilder() {
    return FutureBuilder<List<CommentModel>>(
        future: getCommentData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CommentModel> myCommentList = snapshot.data!;
            return ListView.builder(itemBuilder: (context, index) {
              var oankiComment = myCommentList[index];
              return Card(
                child: ListTile(
                  title: Text(oankiComment.name),
                  subtitle: Text(oankiComment.email),
                  leading: CircleAvatar(
                    child: Text(
                      oankiComment.id.toString(),
                    ),
                  ),
                ),
              );
            });
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
