import 'package:BreakingBadApp/app/modules/deaths/models/DeathsModel.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IDeathsRepository implements Disposable {
  Future<List<DeathsModel>> getListData();
}
