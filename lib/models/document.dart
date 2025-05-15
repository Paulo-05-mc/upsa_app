class Document {
  final String id;
  final String title;
  final String courseName;
  final String fileUrl;

  Document({
    required this.id,
    required this.title,
    required this.courseName,
    required this.fileUrl,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'],
      title: json['title'],
      courseName: json['courseName'],
      fileUrl: json['fileUrl'],
    );
  }
}