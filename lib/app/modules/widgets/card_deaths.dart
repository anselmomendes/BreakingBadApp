import 'package:BreakingBadApp/app/modules/deaths/models/DeathsModel.dart';
import 'package:flutter/material.dart';

class CardDeaths extends StatelessWidget {
  final double height;
  final double width;
  final List<DeathsModel> list;

  const CardDeaths({Key key, this.height, this.width, this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height * 0.01),
        Container(
          height: height * 0.79,
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              DeathsModel model = list[index];
              return Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: width * 0.95,
                    height: height * 0.25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          //color: Colors.green,
                          color: Colors.green[300],
                          width: width * 0.95,
                          child: Text(
                            '  Vítima : ${model.death}',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text('Assassino: ${model.responsible}',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                        Text('Últimas Palavras: ${model.last_words}',
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.sentiment_very_dissatisfied),
                            SizedBox(
                              width: 10,
                            ),
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
          ),
        ),
      ],
    );
  }
}
