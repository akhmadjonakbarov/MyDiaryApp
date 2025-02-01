// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CardModel {
  final String img;
  final bool isSelected;
  CardModel({
    required this.img,
    required this.isSelected,
  });

  CardModel copyWith({
    String? img,
    bool? isSelected,
  }) {
    return CardModel(
      img: img ?? this.img,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'img': img,
      'isSelected': isSelected,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      img: map['img'] as String,
      isSelected: map['isSelected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) =>
      CardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CardModel(img: $img, isSelected: $isSelected)';

  @override
  bool operator ==(covariant CardModel other) {
    if (identical(this, other)) return true;

    return other.img == img && other.isSelected == isSelected;
  }

  @override
  int get hashCode => img.hashCode ^ isSelected.hashCode;
}
