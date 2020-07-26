import 'package:BreakingBadApp/app/modules/deaths/models/DeathsModel.dart';
import 'package:BreakingBadApp/app/modules/deaths/repositories/interfaces/deaths_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'deaths_controller.g.dart';

class DeathsController = _DeathsControllerBase with _$DeathsController;

abstract class _DeathsControllerBase with Store {
  final IDeathsRepository deathsRepository;

  _DeathsControllerBase(this.deathsRepository) {
    get();
  }

  @observable
  List<DeathsModel> deaths = [];

  @action
  get() async {
    deaths = await deathsRepository.getListData();
  }
}
