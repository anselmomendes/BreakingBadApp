import 'perfil/perfil_module.dart';
import 'repositories/characters_repository.dart';
import 'repositories/interfaces/characters_repository_interface.dart';
import 'characters_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'characters_page.dart';

class CharactersModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ICharactersRepository>((i) => CharactersRepository(Dio())),
        Bind((i) => CharactersController(i.get<ICharactersRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CharactersPage()),
        Router('/perfil', module: PerfilModule()),
      ];

  static Inject get to => Inject<CharactersModule>.of();
}
