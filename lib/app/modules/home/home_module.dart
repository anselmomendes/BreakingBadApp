import 'package:BreakingBadApp/app/modules/characters/characters_module.dart';
import 'package:BreakingBadApp/app/modules/deaths/deaths_module.dart';
import 'package:BreakingBadApp/app/modules/episodes/episodes_module.dart';
import 'package:BreakingBadApp/app/modules/quotes/quotes_module.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/characters', module: CharactersModule()),
        Router('/quotes', module: QuotesModule()),
        Router('/episodes', module: EpisodesModule()),
        Router('/deaths', module: DeathsModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
