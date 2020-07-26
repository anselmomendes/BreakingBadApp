// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deaths_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DeathsController on _DeathsControllerBase, Store {
  final _$deathsAtom = Atom(name: '_DeathsControllerBase.deaths');

  @override
  List<DeathsModel> get deaths {
    _$deathsAtom.reportRead();
    return super.deaths;
  }

  @override
  set deaths(List<DeathsModel> value) {
    _$deathsAtom.reportWrite(value, super.deaths, () {
      super.deaths = value;
    });
  }

  final _$getAsyncAction = AsyncAction('_DeathsControllerBase.get');

  @override
  Future get() {
    return _$getAsyncAction.run(() => super.get());
  }

  @override
  String toString() {
    return '''
deaths: ${deaths}
    ''';
  }
}
