class postModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  postModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory postModel.fromJson(Map<String, dynamic> json) {
    return postModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
