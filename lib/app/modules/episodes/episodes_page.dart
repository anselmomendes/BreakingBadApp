import 'package:BreakingBadApp/app/modules/episodes/models/EpisodesModel.dart';
import 'package:BreakingBadApp/app/modules/widgets/app_bar.dart';
import 'package:BreakingBadApp/app/modules/widgets/card_episodes.dart';
import 'package:BreakingBadApp/app/modules/widgets/top_container.dart';
import 'package:BreakingBadApp/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'episodes_controller.dart';

class EpisodesPage extends StatefulWidget {
  final String title;
  const EpisodesPage({Key key, this.title = "Lista de Episódio"})
      : super(key: key);

  @override
  _EpisodesPageState createState() => _EpisodesPageState();
}

class _EpisodesPageState
    extends ModularState<EpisodesPage, EpisodesController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          color: Colors.green[700],
          child: Column(
            children: [
              CustonAppBar(
                title: widget.title,
                height: height,
                width: width,
              ),
              TopContainer(
                height: height,
                width: width,
                child: Observer(
                  builder: (_) {
                    if (controller.episodes == null)
                      return Center(
                        child: CircularProgressIndicator(),
                      );

                    List<EpisodesModel> list = controller.episodes;
                    if (controller.episodes.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      );
                    }
                    return CardEpisodes(
                      height: height,
                      width: width,
                      list: list,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
