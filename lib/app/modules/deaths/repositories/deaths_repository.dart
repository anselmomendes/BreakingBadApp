import 'package:BreakingBadApp/app/modules/deaths/models/DeathsModel.dart';
import 'package:dio/dio.dart';
import 'interfaces/deaths_repository_interface.dart';

class DeathsRepository implements IDeathsRepository {
  final Dio dio;

  DeathsRepository(this.dio);

  Future<List<DeathsModel>> getListData() async {
    final response = await dio.get("https://breakingbadapi.com/api/deaths");
    return response.data
        .map((data) => DeathsModel.fromMap(data))
        .toList()
        .cast<DeathsModel>();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
