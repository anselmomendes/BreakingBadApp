import 'package:BreakingBadApp/app/modules/episodes/models/EpisodesModel.dart';
import 'package:dio/dio.dart';
import 'interfaces/episodes_repository_interface.dart';

class EpisodesRepository implements IEpisodesRepository {
  final Dio dio;

  EpisodesRepository(this.dio);

  Future<List<EspisodesModel>> getListData() async {
    final response = await dio.get("https://breakingbadapi.com/api/episodes");
    return response.data
        .map((data) => EspisodesModel.fromMap(data))
        .toList()
        .cast<EspisodesModel>();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
