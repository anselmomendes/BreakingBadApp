import 'package:BreakingBadApp/app/modules/episodes/models/EpisodesModel.dart';
import 'package:BreakingBadApp/app/modules/episodes/repositories/interfaces/episodes_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'episodes_controller.g.dart';

class EpisodesController = _EpisodesControllerBase with _$EpisodesController;

abstract class _EpisodesControllerBase with Store {
  final IEpisodesRepository episodesRepository;

  _EpisodesControllerBase(this.episodesRepository) {
    get();
  }

  @observable
  List<EspisodesModel> episodes = [];

  @action
  get() async {
    episodes = await episodesRepository.getListData();
  }
}
