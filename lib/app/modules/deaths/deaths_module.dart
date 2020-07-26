import 'repositories/deaths_repository.dart';
import 'repositories/interfaces/deaths_repository_interface.dart';
import 'deaths_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'deaths_page.dart';

class DeathsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IDeathsRepository>((i) => DeathsRepository(Dio())),
        Bind((i) => DeathsController(i.get<IDeathsRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => DeathsPage()),
      ];

  static Inject get to => Inject<DeathsModule>.of();
}
