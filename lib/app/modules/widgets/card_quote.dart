import 'package:BreakingBadApp/app/modules/quotes/Models/QuotesModel.dart';
import 'package:flutter/material.dart';

class CardQuote extends StatelessWidget {
  final double height;
  final double width;
  final List<QuotesModel> list;

  const CardQuote({Key key, this.height, this.width, this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.7,
      width: width - 30,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          QuotesModel model = list[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.grey[200], Colors.grey[300]]),
                    borderRadius: BorderRadius.circular(5.0)),
                height: 100,
                width: width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 75,
                      child: Text(model.quote.toUpperCase(),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black)),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Container(
                        height: 25,
                        child: Text(
                          ' Autor: ${model.author} ',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 11),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          );
        },
      ),
    );
  }
}
