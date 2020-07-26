import 'package:BreakingBadApp/app/modules/deaths/models/DeathsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'deaths_controller.dart';

class DeathsPage extends StatefulWidget {
  final String title;
  const DeathsPage({Key key, this.title = "Mortes"}) : super(key: key);

  @override
  _DeathsPageState createState() => _DeathsPageState();
}

class _DeathsPageState extends ModularState<DeathsPage, DeathsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[700],
        title: Text(widget.title),
      ),
      body: Container(
        child: Observer(
          builder: (_) {
            if (controller.deaths == null)
              return Center(
                child: CircularProgressIndicator(),
              );

            List<DeathsModel> list = controller.deaths;
            if (controller.deaths.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }
            return ListView.builder(
              itemCount: controller.deaths.length,
              itemBuilder: (_, index) {
                DeathsModel model = list[index];
                return Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: screenWidth * 0.95,
                      height: screenWidth * 0.48,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              //color: Colors.green,
                              color: Colors.green[300],
                              width: screenWidth * 0.95,
                              child: Text('  Vítima : ${model.death}',
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ))),
                          Text('Assassino: ${model.responsible}',
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700)),
                          Text('Últimas Palavras: ${model.last_words}',
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400)),
                          Text('Temporada: ${model.season}',
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                          Text(
                            'Episódio: ${model.episode}',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.sentiment_very_dissatisfied),
                              Text('Homicídios:  '),
                              SizedBox(
                                width: 30,
                              ),
                              Text(model.number_of_deaths.toString())
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
