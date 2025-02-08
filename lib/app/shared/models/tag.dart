class Tag {
  final int? id;
  final String value;

  Tag({this.id, required this.value});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map['id'],
      value: map['value'],
    );
  }

  @override
  String toString() {
    return 'Tag{id: $id, value: $value}';
  }
}
