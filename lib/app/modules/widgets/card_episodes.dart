import 'package:BreakingBadApp/app/modules/episodes/models/EpisodesModel.dart';
import 'package:flutter/material.dart';

class CardEpisodes extends StatelessWidget {
  final double width;
  final double height;
  final List<EpisodesModel> list;

  const CardEpisodes({Key key, this.width, this.height, this.list})
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
              EpisodesModel model = list[index];

              return Card(
                child: Container(
                  width: width - 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.green[300],
                        width: width - 60,
                        child: Text(
                          ' Nome: ${model.title}',
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text('Data de lançamento: ${model.air_date}',
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      Text('Temporada: ${model.season}',
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                      Text('Episódio: ${model.episode}',
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                      Text('Elenco: ${model.characters.map((e) => e)}',
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
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
