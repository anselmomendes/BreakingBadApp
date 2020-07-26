import 'repositories/perfil_repository.dart';
import 'repositories/interfaces/perfil_repository_interface.dart';
import 'perfil_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'perfil_page.dart';

class PerfilModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IPerfilRepository>((i) => PerfilRepository(Dio())),
        Bind((i) => PerfilController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => PerfilPage(model: args.data)),
      ];

  static Inject get to => Inject<PerfilModule>.of();
}
