import 'package:BreakingBadApp/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'characters_controller.dart';
import 'models/CharactersModel.dart';

class CharactersPage extends StatefulWidget {
  final String title;
  const CharactersPage({Key key, this.title = "Personagens"}) : super(key: key);

  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState
    extends ModularState<CharactersPage, CharactersController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: LightColors.kLightGreen,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green[700],
          height: screenHeight,
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.2,
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
                      'PERSONAGENS',
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: screenWidth - 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                      )),
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight * 0.1,
                        width: screenWidth - 60,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: controller.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                color: Colors.green,
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  controller.getSeach();
                                },
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.green,
                              ),
                              labelText: "Pesquise aqui seu personagem",
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) {
                          if (controller.characters == null)
                            return Container(
                              height: screenHeight * 0.7,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );

                          List<CharacteresModel> list = controller.characters;
                          if (list.isEmpty)
                            return Container(
                              height: screenHeight * 0.7,
                              width: screenWidth - 60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: screenWidth - 120,
                                    height: screenHeight * 0.2,
                                    child: Image.asset('assets/images/02.png'),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text('NENHUM ITEM FOI ENCONTRADO!'),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  FlatButton(
                                    color: Colors.green,
                                    onPressed: () async {
                                      await controller.get();
                                    },
                                    child: Container(
                                      height: screenHeight * 0.05,
                                      width: screenWidth - 160,
                                      child: Center(
                                        child: Text(
                                          'TENTAR NOVAMENTE?',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          return Column(
                            children: [
                              Container(
                                width: screenWidth - 60,
                                height: screenHeight * 0.7,
                                child: ListView.builder(
                                  itemCount: controller.characters.length,
                                  itemBuilder: (_, index) {
                                    CharacteresModel model = list[index];

                                    return GestureDetector(
                                      child: Card(
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: screenWidth * 0.4,
                                                width: screenWidth * 0.25,
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Colors.green[300]),
                                                child: Image.network(
                                                  model.img,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Container(
                                                  width: screenWidth * 0.7 - 60,
                                                  height: screenWidth * 0.40,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          //color: Colors.green,
                                                          color:
                                                              Colors.green[300],
                                                          width:
                                                              screenWidth * 0.7,
                                                          child: Text(
                                                              ' Nome: ${model.name}',
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ))),
                                                      Text(
                                                          'Apelido: ${model.nickname}',
                                                          overflow:
                                                              TextOverflow.clip,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                      Text(
                                                          'Profissão: ${model.occupation.map((e) => e)}',
                                                          overflow:
                                                              TextOverflow.clip,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      Text(
                                                          'Data de Aniversário: ${model.birthday}',
                                                          overflow:
                                                              TextOverflow.clip,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      Text(
                                                          'Nome do Ator: ${model.portrayed}',
                                                          overflow:
                                                              TextOverflow.clip,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Modular.to.pushNamed(
                                            '/characters/perfil',
                                            arguments: model);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
