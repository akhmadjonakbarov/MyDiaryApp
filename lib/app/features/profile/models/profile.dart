// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile {
  final String fullName;
  final String status;
  final String about;
  final String? imagePath;
  Profile({
    required this.fullName,
    required this.status,
    required this.about,
    this.imagePath,
  });

  factory Profile.empty() {
    return Profile(
      fullName: '',
      status: '',
      about: '',
      imagePath: '',
    );
  }

  Profile copyWith({
    String? fullName,
    String? status,
    String? about,
    String? imagePath,
  }) {
    return Profile(
      fullName: fullName ?? this.fullName,
      status: status ?? this.status,
      about: about ?? this.about,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'status': status,
      'about': about,
      'imagePath': imagePath,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      fullName: map['fullName'] as String,
      status: map['status'] as String,
      about: map['about'] as String,
      imagePath: map['imagePath'] != null ? map['imagePath'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(fullName: $fullName, status: $status, about: $about, imagePath: $imagePath)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.fullName == fullName &&
        other.status == status &&
        other.about == about &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        status.hashCode ^
        about.hashCode ^
        imagePath.hashCode;
  }
}
