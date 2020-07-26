import 'repositories/quotes_repository.dart';
import 'repositories/interfaces/quotes_repository_interface.dart';
import 'quotes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'quotes_page.dart';

class QuotesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IQuotesRepository>((i) => QuotesRepository(Dio())),
        Bind((i) => QuotesController(i.get<IQuotesRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => QuotesPage()),
      ];

  static Inject get to => Inject<QuotesModule>.of();
}
