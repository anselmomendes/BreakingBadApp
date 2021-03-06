// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuotesController on _QuotesControllerBase, Store {
  final _$quotesAtom = Atom(name: '_QuotesControllerBase.quotes');

  @override
  List<QuotesModel> get quotes {
    _$quotesAtom.reportRead();
    return super.quotes;
  }

  @override
  set quotes(List<QuotesModel> value) {
    _$quotesAtom.reportWrite(value, super.quotes, () {
      super.quotes = value;
    });
  }

  final _$textAtom = Atom(name: '_QuotesControllerBase.text');

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

  final _$getAsyncAction = AsyncAction('_QuotesControllerBase.get');

  @override
  Future get() {
    return _$getAsyncAction.run(() => super.get());
  }

  final _$getSeachAsyncAction = AsyncAction('_QuotesControllerBase.getSeach');

  @override
  Future getSeach() {
    return _$getSeachAsyncAction.run(() => super.getSeach());
  }

  @override
  String toString() {
    return '''
quotes: ${quotes},
text: ${text}
    ''';
  }
}
