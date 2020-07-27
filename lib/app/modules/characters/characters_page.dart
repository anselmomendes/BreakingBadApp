import 'package:BreakingBadApp/app/modules/widgets/CustonTextField.dart';
import 'package:BreakingBadApp/app/modules/widgets/app_bar.dart';
import 'package:BreakingBadApp/app/modules/widgets/list_empty.dart';
import 'package:BreakingBadApp/app/modules/widgets/top_container.dart';
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
              CustonAppBar(
                  height: screenHeight,
                  width: screenWidth,
                  title: widget.title),
              TopContainer(
                height: screenHeight,
                width: screenWidth,
                child: Column(
                  children: [
                    CustonTextField(
                        height: screenHeight,
                        width: screenWidth,
                        text: controller.text,
                        func: controller.getSeach()),
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
                        print('############aaa');
                        if (list.isEmpty)
                          return ListEmpty(
                            height: screenHeight,
                            width: screenWidth,
                            func: controller.getSeach(),
                          );
                        return Container(
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
                                                  BorderRadius.circular(15),
                                              color: Colors.green[300]),
                                          child: Image.network(
                                            model.img,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Container(
                                            width: screenWidth * 0.7 - 60,
                                            height: screenWidth * 0.40,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                    //color: Colors.green,
                                                    color: Colors.green[300],
                                                    width: screenWidth * 0.7,
                                                    child: Text(
                                                        ' Nome: ${model.name}',
                                                        overflow:
                                                            TextOverflow.clip,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))),
                                                Text(
                                                    'Apelido: ${model.nickname}',
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Text(
                                                    'Profissão: ${model.occupation.map((e) => e)}',
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    'Data de Aniversário: ${model.birthday}',
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                  'Nome do Ator: ${model.portrayed}',
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Modular.to.pushNamed('/characters/perfil',
                                      arguments: model);
                                },
                              );
                            },
                          ),
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
