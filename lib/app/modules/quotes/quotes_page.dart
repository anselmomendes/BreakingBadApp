import 'package:BreakingBadApp/app/modules/quotes/Models/QuotesModel.dart';
import 'package:BreakingBadApp/app/modules/widgets/CustonTextField.dart';
import 'package:BreakingBadApp/app/modules/widgets/app_bar.dart';
import 'package:BreakingBadApp/app/modules/widgets/card_quote.dart';
import 'package:BreakingBadApp/app/modules/widgets/list_empty.dart';
import 'package:BreakingBadApp/app/modules/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'quotes_controller.dart';

class QuotesPage extends StatefulWidget {
  final String title;
  const QuotesPage({Key key, this.title = 'Frases antâgonicas'})
      : super(key: key);

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends ModularState<QuotesPage, QuotesController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                width: width,
                height: height,
                child: Column(
                  children: [
                    CustonTextField(
                      height: height,
                      width: width,
                      text: controller.text,
                      func: controller.getSeach(),
                    ),
                    Observer(
                      builder: (_) {
                        if (controller.quotes == null)
                          return Container(
                            height: height * 0.7,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );

                        List<QuotesModel> list = controller.quotes;
                        return CardQuote(
                          height: height,
                          width: width,
                          list: list,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
