// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharactersController on _CharactersControllerBase, Store {
  final _$charactersAtom = Atom(name: '_CharactersControllerBase.characters');

  @override
  List<CharacteresModel> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(List<CharacteresModel> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  final _$textAtom = Atom(name: '_CharactersControllerBase.text');

  @override
  TextEditingController get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(TextEditingController value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$getAsyncAction = AsyncAction('_CharactersControllerBase.get');

  @override
  Future get() {
    return _$getAsyncAction.run(() => super.get());
  }

  final _$getSeachAsyncAction =
      AsyncAction('_CharactersControllerBase.getSeach');

  @override
  Future getSeach() {
    return _$getSeachAsyncAction.run(() => super.getSeach());
  }

  @override
  String toString() {
    return '''
characters: ${characters},
text: ${text}
    ''';
  }
}
