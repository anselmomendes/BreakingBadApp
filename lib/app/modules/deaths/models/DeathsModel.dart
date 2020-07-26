import 'dart:convert';

class DeathsModel {
  final String death;
  final String cause;
  final String responsible;
  final String last_words;
  final int season;
  final int episode;
  final int number_of_deaths;
  DeathsModel({
    this.death,
    this.cause,
    this.responsible,
    this.last_words,
    this.season,
    this.episode,
    this.number_of_deaths,
  });

  DeathsModel copyWith({
    String death,
    String cause,
    String responsible,
    String last_words,
    int season,
    int episode,
    int number_of_deaths,
  }) {
    return DeathsModel(
      death: death ?? this.death,
      cause: cause ?? this.cause,
      responsible: responsible ?? this.responsible,
      last_words: last_words ?? this.last_words,
      season: season ?? this.season,
      episode: episode ?? this.episode,
      number_of_deaths: number_of_deaths ?? this.number_of_deaths,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'death': death,
      'cause': cause,
      'responsible': responsible,
      'last_words': last_words,
      'season': season,
      'episode': episode,
      'number_of_deaths': number_of_deaths,
    };
  }

  static DeathsModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DeathsModel(
      death: map['death'],
      cause: map['cause'],
      responsible: map['responsible'],
      last_words: map['last_words'],
      season: map['season'],
      episode: map['episode'],
      number_of_deaths: map['number_of_deaths'],
    );
  }

  String toJson() => json.encode(toMap());

  static DeathsModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'DeathsModel(death: $death, cause: $cause, responsible: $responsible, last_words: $last_words, season: $season, episode: $episode, number_of_deaths: $number_of_deaths)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DeathsModel &&
        o.death == death &&
        o.cause == cause &&
        o.responsible == responsible &&
        o.last_words == last_words &&
        o.season == season &&
        o.episode == episode &&
        o.number_of_deaths == number_of_deaths;
  }

  @override
  int get hashCode {
    return death.hashCode ^
        cause.hashCode ^
        responsible.hashCode ^
        last_words.hashCode ^
        season.hashCode ^
        episode.hashCode ^
        number_of_deaths.hashCode;
  }
}
