import 'package:dio/dio.dart';
import 'package:frontend/models/game.dart';

class GameService {
  static Future<List<Game>> getAllGames() async {
    final dio = Dio(BaseOptions(baseUrl: "http://192.168.0.56:6969/games"));
    final response = await dio.get("/all_games");

    final responseList = response.data as List;

    final gameList = responseList.map((resp) => Game.fromMap(resp)).toList();

    return gameList;
  }

  static Future<Game> getGameById({required int id}) async {
    final dio = Dio(BaseOptions(baseUrl: "http://192.168.0.56:6969/games"));
    final response = await dio.get("/game/$id");

    return Game.fromMap(response.data);
  }
}
