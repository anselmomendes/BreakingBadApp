import 'package:BreakingBadApp/app/modules/episodes/models/EpisodesModel.dart';
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
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[700],
        title: Text(widget.title),
      ),
      body: Container(
        child: Observer(
          builder: (_) {
            if (controller.episodes == null)
              return Center(
                child: CircularProgressIndicator(),
              );

            List<EspisodesModel> list = controller.episodes;
            if (controller.episodes.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }
            return ListView.builder(
              itemCount: controller.episodes.length,
              itemBuilder: (_, index) {
                EspisodesModel model = list[index];

                return GestureDetector(
                  child: Card(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: screenWidth * 0.95,
                            height: screenWidth * 0.40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    //color: Colors.green,
                                    color: Colors.green[300],
                                    width: screenWidth * 0.95,
                                    child: Text(' Nome: ${model.title}',
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ))),
                                Text('Data de lançamento: ${model.air_date}',
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                Text('Temporada: ${model.season}',
                                    overflow: TextOverflow.clip,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                                Text('Episódio: ${model.episode}',
                                    overflow: TextOverflow.clip,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                    'Elenco: ${model.characters.map((e) => e)}',
                                    overflow: TextOverflow.clip,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Modular.to
                        .pushNamed('/characters/perfil', arguments: model);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
