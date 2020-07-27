import 'package:BreakingBadApp/app/modules/characters/models/CharactersModel.dart';
import 'package:BreakingBadApp/app/modules/quotes/Models/QuotesModel.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IQuotesRepository implements Disposable {
  Future<List<QuotesModel>> getListData();
  Future<List<QuotesModel>> getListSeach(String quote);
}
