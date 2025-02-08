class Entry {
  int? id;
  String title;
  String description;
  String tag;
  String createdDate;
  List<String> imagePaths;

  Entry({ this.id,
    required this.title,
    required this.description,
    required this.tag,
    required this.createdDate,
    List<String>? imagePaths,
  }) : imagePaths = imagePaths ?? []; // Ensure it's never null
  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      id: map['id'] as int,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      tag: map['tag'] ?? '',
      createdDate: map['createdDate'] ?? '',
      imagePaths: map['image'] != null && map['image'].toString().isNotEmpty
          ? [map['image'].toString()]
          : [], // Ensure imagePaths is always a list
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'tag': tag,
      'createdDate': createdDate,
    };
  }
}
