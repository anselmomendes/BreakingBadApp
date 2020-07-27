import 'package:BreakingBadApp/app/modules/deaths/models/DeathsModel.dart';
import 'package:BreakingBadApp/app/modules/widgets/app_bar.dart';
import 'package:BreakingBadApp/app/modules/widgets/card_deaths.dart';
import 'package:BreakingBadApp/app/modules/widgets/top_container.dart';
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                    return CardDeaths(
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
