import 'package:BreakingBadApp/app/modules/quotes/Models/QuotesModel.dart';
import 'package:dio/dio.dart';
import 'interfaces/quotes_repository_interface.dart';

class QuotesRepository implements IQuotesRepository {
  final Dio dio;

  QuotesRepository(this.dio);

  Future<List<QuotesModel>> getListData() async {
    final response = await dio.get("https://breakingbadapi.com/api/quotes");
    return response.data
        .map((data) => QuotesModel.fromMap(data))
        .toList()
        .cast<QuotesModel>();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
