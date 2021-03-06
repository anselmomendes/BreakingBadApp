import 'dart:convert';

import 'package:flutter/foundation.dart';

class EpisodesModel {
  final String title;
  final String season;
  final String air_date;
  final List<String> characters;
  final String episode;
  EpisodesModel({
    this.title,
    this.season,
    this.air_date,
    this.characters,
    this.episode,
  });

  EpisodesModel copyWith({
    String title,
    String season,
    String air_date,
    List<String> characters,
    String episode,
  }) {
    return EpisodesModel(
      title: title ?? this.title,
      season: season ?? this.season,
      air_date: air_date ?? this.air_date,
      characters: characters ?? this.characters,
      episode: episode ?? this.episode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'season': season,
      'air_date': air_date,
      'characters': characters,
      'episode': episode,
    };
  }

  static EpisodesModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EpisodesModel(
      title: map['title'],
      season: map['season'],
      air_date: map['air_date'],
      characters: List<String>.from(map['characters']),
      episode: map['episode'],
    );
  }

  String toJson() => json.encode(toMap());

  static EpisodesModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'EspisodesModel(title: $title, season: $season, air_date: $air_date, characters: $characters, episode: $episode)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EpisodesModel &&
        o.title == title &&
        o.season == season &&
        o.air_date == air_date &&
        listEquals(o.characters, characters) &&
        o.episode == episode;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        season.hashCode ^
        air_date.hashCode ^
        characters.hashCode ^
        episode.hashCode;
  }
}
