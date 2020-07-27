import 'package:BreakingBadApp/app/modules/episodes/models/EpisodesModel.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IEpisodesRepository implements Disposable {
  Future<List<EpisodesModel>> getListData();
}
