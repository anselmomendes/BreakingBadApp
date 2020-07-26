import 'package:BreakingBadApp/app/modules/characters/models/CharactersModel.dart';
import 'package:dio/dio.dart';
import 'interfaces/characters_repository_interface.dart';

class CharactersRepository implements ICharactersRepository {
  final Dio dio;

  CharactersRepository(this.dio);

  Future<List<CharacteresModel>> getListData() async {
    final response = await dio.get("https://breakingbadapi.com/api/characters");
    return response.data
        .map((data) => CharacteresModel.fromMap(data))
        .toList()
        .cast<CharacteresModel>();
  }

  Future<List<CharacteresModel>> getListSeach(String ep) async {
    final response = await dio.get("https://breakingbadapi.com/api/characters",
        queryParameters: {"name": ep});
    return response.data
        .map((data) => CharacteresModel.fromMap(data))
        .toList()
        .cast<CharacteresModel>();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
