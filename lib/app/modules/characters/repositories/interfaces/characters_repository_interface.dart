import 'package:BreakingBadApp/app/modules/characters/models/CharactersModel.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class ICharactersRepository implements Disposable {
  Future<List<CharacteresModel>> getListData();
  Future<List<CharacteresModel>> getListSeach(String ep);
}
