class Entry {
  final String title;
  final String description;
  final String tag;
  final List<String> imagePaths;
  final String createdDate;

  Entry(
      {required this.title,
      required this.tag,
      required this.description,
      required this.imagePaths,
      required this.createdDate});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'tag': tag,
      'createdDate': createdDate
    };
  }
}
