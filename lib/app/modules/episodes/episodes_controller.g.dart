// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EpisodesController on _EpisodesControllerBase, Store {
  final _$episodesAtom = Atom(name: '_EpisodesControllerBase.episodes');

  @override
  List<EpisodesModel> get episodes {
    _$episodesAtom.reportRead();
    return super.episodes;
  }

  @override
  set episodes(List<EpisodesModel> value) {
    _$episodesAtom.reportWrite(value, super.episodes, () {
      super.episodes = value;
    });
  }

  final _$getAsyncAction = AsyncAction('_EpisodesControllerBase.get');

  @override
  Future get() {
    return _$getAsyncAction.run(() => super.get());
  }

  @override
  String toString() {
    return '''
episodes: ${episodes}
    ''';
  }
}
