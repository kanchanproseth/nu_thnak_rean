// enum PostType { Announcement, Assignment, File, Question }

class PostModel {
  final int id;
  final String by;
  final int numberOfComments;
  final int numberOfAnswers;
  final int numberOfDownloads;
  final String content;
  final String createdAt;
  String postType;
  final String status;

  PostModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        by = parsedJson['by'],
        numberOfComments = parsedJson['numberOfComments'] ?? 0,
        numberOfAnswers = parsedJson['numberOfAnswers'] ?? 0,
        numberOfDownloads = parsedJson['numberOfDownloads'] ?? 0,
        content =parsedJson['content'],
        createdAt = parsedJson['createdAt'],
        postType = parsedJson['postType'],
        status = parsedJson['status'];

  @override
  String toString() {
    print("""
      {
        "id": $id,
        "by": $by,
        "numberOfComments": $numberOfComments,
        "numberOfAnswers": $numberOfAnswers,
        "numberOfDownloads": $numberOfDownloads,
        "content": $content,
        "createdAt": $createdAt,
        "postType": $postType,
        "status": $status
      },
    """);
    return super.toString();
  }
}
