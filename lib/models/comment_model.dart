class CommentModel {
  final int id;
  final String by;
  final String createdAt;
  final int postId;

  CommentModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        by = parsedJson['by'],
        createdAt = parsedJson['createdAt'],
        postId = parsedJson['postId'];

  @override
  String toString() {
    print("""
      {
        "id": $id,
        "name": $by,
        "createdAt": $createdAt,
        "postId": $postId
      }
    """);
    return super.toString();
  }
}
