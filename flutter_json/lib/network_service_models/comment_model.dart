import 'dart:convert';

class CommentModel {
  CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  CommentModel copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) =>
      CommentModel(
        postId: postId ?? this.postId,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        body: body ?? this.body,
      );

  factory CommentModel.fromJson(String str) =>
      CommentModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentModel.fromMap(Map<String, dynamic> json) => CommentModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
