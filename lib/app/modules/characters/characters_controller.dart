import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'models/CharactersModel.dart';
import 'repositories/interfaces/characters_repository_interface.dart';

part 'characters_controller.g.dart';

class CharactersController = _CharactersControllerBase
    with _$CharactersController;

abstract class _CharactersControllerBase with Store {
  final ICharactersRepository charactersRepository;

  _CharactersControllerBase(this.charactersRepository) {
    get();
  }

  @observable
  List<CharacteresModel> characters;

  @observable
  TextEditingController text = TextEditingController();

  @action
  get() async {
    characters = await charactersRepository.getListData();
  }

  @action
  getSeach() async {
    characters = await charactersRepository.getListSeach(text.text);
  }
}
