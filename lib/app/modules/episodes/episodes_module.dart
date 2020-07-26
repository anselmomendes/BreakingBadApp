import 'repositories/episodes_repository.dart';
import 'repositories/interfaces/episodes_repository_interface.dart';
import 'episodes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'episodes_page.dart';

class EpisodesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IEpisodesRepository>((i) => EpisodesRepository(Dio())),
        Bind((i) => EpisodesController(i.get<IEpisodesRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => EpisodesPage()),
      ];

  static Inject get to => Inject<EpisodesModule>.of();
}
