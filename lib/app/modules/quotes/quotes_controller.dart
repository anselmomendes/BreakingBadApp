import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'Models/QuotesModel.dart';
import 'repositories/interfaces/quotes_repository_interface.dart';

part 'quotes_controller.g.dart';

class QuotesController = _QuotesControllerBase with _$QuotesController;

abstract class _QuotesControllerBase with Store {
  final IQuotesRepository quotesRepository;

  @observable
  List<QuotesModel> quotes;

  @observable
  TextEditingController text = TextEditingController();

  _QuotesControllerBase(this.quotesRepository) {
    get();
  }

  @action
  get() async {
    quotes = await quotesRepository.getListData();
  }

  @action
  getSeach() async {
    //quotes = await quotesRepository.getListSeach(text.text);
  }
}
