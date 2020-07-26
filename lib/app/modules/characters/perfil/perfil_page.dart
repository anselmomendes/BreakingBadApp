import 'package:BreakingBadApp/app/modules/characters/models/CharactersModel.dart';
import 'package:BreakingBadApp/app/modules/widgets/top_container.dart';
import 'package:BreakingBadApp/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'perfil_controller.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  final CharacteresModel model;
  const PerfilPage({Key key, this.title = "Perfil", this.model})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<PerfilPage, PerfilController> {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.work,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  static CircleAvatar birthdayIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.cake,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  static CircleAvatar personIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.person,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  static CircleAvatar statusIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.sentiment_dissatisfied,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 250,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          child: Icon(Icons.arrow_back,
                              color: LightColors.kDarkBlue, size: 30.0),
                          onTap: () {
                            Modular.to.pop();
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CircularPercentIndicator(
                                radius: 150.0,
                                lineWidth: 5.0,
                                animation: true,
                                percent: 1,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: LightColors.kGreen,
                                backgroundColor: LightColors.kDarkYellow,
                                center: CircleAvatar(
                                  backgroundColor: LightColors.kBlue,
                                  radius: 65,
                                  backgroundImage: NetworkImage(
                                      widget.model.img,
                                      scale: 0.8),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  widget.model.nickname,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: LightColors.kDarkBlue,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  widget.model.name,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Profissão'),
                              calendarIcon(),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            height: 150,
                            child: ListView.builder(
                              itemCount: widget.model.occupation.length,
                              itemBuilder: (_, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.orange[100],
                                          border: Border.all(
                                              width: 3.0, color: Colors.green),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15.0),
                                          )),
                                      child: Text(
                                        ' ${widget.model.occupation[index]} ',
                                        style: TextStyle(
                                            color: LightColors.kDarkBlue,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.2),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Aniversário'),
                              birthdayIcon(),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange[100],
                                    border: Border.all(
                                        width: 3.0, color: Colors.green),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    )),
                                child: Text(
                                  ' ${widget.model.birthday} ',
                                  style: TextStyle(
                                      color: LightColors.kDarkBlue,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1.2),
                                ),
                              ),
                              SizedBox(width: 1.0),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Ator'),
                              personIcon(),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange[100],
                                    border: Border.all(
                                        width: 3.0, color: Colors.green),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    )),
                                child: Text(
                                  ' ${widget.model.portrayed} ',
                                  style: TextStyle(
                                      color: LightColors.kDarkBlue,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1.2),
                                ),
                              ),
                              SizedBox(width: 1.0),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Status'),
                              statusIcon(),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange[100],
                                    border: Border.all(
                                        width: 3.0, color: Colors.green),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    )),
                                child: Text(
                                  ' ${widget.model.status} ',
                                  style: TextStyle(
                                      color: LightColors.kDarkBlue,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1.2),
                                ),
                              ),
                              SizedBox(width: 1.0),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
