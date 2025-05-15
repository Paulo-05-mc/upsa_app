class Course {
  final String id;
  final String name;
  final String code;
  final int docCount;
  final bool isCompleted;

  Course({
    required this.id,
    required this.name,
    required this.code,
    required this.docCount,
    this.isCompleted = false,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
  return Course(
    id: json['id'],
    name: json['name'],
    code: json['code'],
    docCount: json['docCount'],
  );
}

}

