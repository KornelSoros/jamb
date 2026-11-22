import 'package:flutter/material.dart';
import 'package:frontend/screens/jamb_table_screen.dart';
import 'package:frontend/services/game_service.dart';

import '../models/game.dart';

class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Game> games = [];

  Future<void> initDatas() async {
    games = await GameService.getAllGames();
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => await initDatas(),
    );
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Játékok"))),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            int gameId = games[index].id;
            return Card(
              child: Column(
                children: [
                  Text("${gameId.toString()}. játék"),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return JambTableScreen(gameId: gameId);
                          },
                        ),
                      );
                    },
                    label: Text("Megnyitás"),
                    icon: Icon(Icons.open_in_new_outlined),
                  ),
                ],
              ),
            );
          },
          itemCount: games.length,
        ),
      ),
    );
  }
}
