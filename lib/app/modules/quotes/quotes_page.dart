import 'package:BreakingBadApp/app/modules/quotes/Models/QuotesModel.dart';
import 'package:BreakingBadApp/app/modules/widgets/top_container.dart';
import 'package:BreakingBadApp/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'quotes_controller.dart';

class QuotesPage extends StatefulWidget {
  final String title;
  const QuotesPage({Key key, this.title = "Quotes"}) : super(key: key);

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends ModularState<QuotesPage, QuotesController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: LightColors.kLightGreen,
      body: Container(
        height: height,
        width: width,
        color: Colors.green[700],
        child: Column(
          children: [
            Container(
              height: height * 0.2,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_back,
                                color: Colors.white, size: 30.0),
                            onPressed: () {
                              Modular.to.pop();
                            }),
                      ]),
                  Text(
                    'FRASES ANTAGÔNICAS',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    )),
                height: height * 0.8,
                child: Observer(
                  builder: (_) {
                    if (controller.quotes == null)
                      return Center(
                        child: CircularProgressIndicator(),
                      );

                    List<QuotesModel> list = controller.quotes;
                    return Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: ListView.builder(
                        itemCount: controller.quotes.length,
                        itemBuilder: (_, index) {
                          QuotesModel model = list[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.grey[200],
                                          Colors.grey[300]
                                        ]),
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
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 25,
                                            child: Text(
                                              ' Autor: ${model.author} ',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
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
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
