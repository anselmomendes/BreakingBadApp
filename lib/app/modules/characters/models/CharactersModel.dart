import 'dart:convert';

import 'package:flutter/foundation.dart';

class CharacteresModel {
  final int charId;
  final String name;
  final String birthday;
  final List<String> occupation;
  final String img;
  final String status;
  final String nickname;
  final List<int> appearance;
  final String portrayed;
  final String category;
  final List<int> better_call_saul_appearance;

  CharacteresModel({
    this.charId,
    this.name,
    this.birthday,
    this.occupation,
    this.img,
    this.status,
    this.nickname,
    this.appearance,
    this.portrayed,
    this.category,
    this.better_call_saul_appearance,
  });

  CharacteresModel copyWith({
    int charId,
    String name,
    String birthday,
    List<String> occupation,
    String img,
    String status,
    String nickname,
    List<int> appearance,
    String portrayed,
    String category,
    List<int> better_call_saul_appearance,
  }) {
    return CharacteresModel(
      charId: charId ?? this.charId,
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      occupation: occupation ?? this.occupation,
      img: img ?? this.img,
      status: status ?? this.status,
      nickname: nickname ?? this.nickname,
      appearance: appearance ?? this.appearance,
      portrayed: portrayed ?? this.portrayed,
      category: category ?? this.category,
      better_call_saul_appearance:
          better_call_saul_appearance ?? this.better_call_saul_appearance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'charId': charId,
      'name': name,
      'birthday': birthday,
      'occupation': occupation,
      'img': img,
      'status': status,
      'nickname': nickname,
      'appearance': appearance,
      'portrayed': portrayed,
      'category': category,
      'better_call_saul_appearance': better_call_saul_appearance,
    };
  }

  static CharacteresModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CharacteresModel(
      charId: map['charId'],
      name: map['name'],
      birthday: map['birthday'],
      occupation: List<String>.from(map['occupation']),
      img: map['img'],
      status: map['status'],
      nickname: map['nickname'],
      appearance: List<int>.from(map['appearance']),
      portrayed: map['portrayed'],
      category: map['category'],
      better_call_saul_appearance:
          List<int>.from(map['better_call_saul_appearance']),
    );
  }

  String toJson() => json.encode(toMap());

  static CharacteresModel fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() {
    return 'CharacteresModel(charId: $charId, name: $name, birthday: $birthday, occupation: $occupation, img: $img, status: $status, nickname: $nickname, appearance: $appearance, portrayed: $portrayed, category: $category, better_call_saul_appearance: $better_call_saul_appearance)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CharacteresModel &&
        o.charId == charId &&
        o.name == name &&
        o.birthday == birthday &&
        listEquals(o.occupation, occupation) &&
        o.img == img &&
        o.status == status &&
        o.nickname == nickname &&
        listEquals(o.appearance, appearance) &&
        o.portrayed == portrayed &&
        o.category == category &&
        listEquals(o.better_call_saul_appearance, better_call_saul_appearance);
  }

  @override
  int get hashCode {
    return charId.hashCode ^
        name.hashCode ^
        birthday.hashCode ^
        occupation.hashCode ^
        img.hashCode ^
        status.hashCode ^
        nickname.hashCode ^
        appearance.hashCode ^
        portrayed.hashCode ^
        category.hashCode ^
        better_call_saul_appearance.hashCode;
  }
}
