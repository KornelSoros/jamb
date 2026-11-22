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
    // print(
    //   "EZEK A KIBASZOTT JÁTÉK ID-K: ${games.map((game) => game.id).toList()}",
    // );

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Játékok"))),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Expanded(
              child: Center(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [Text(games[index].id.toString())],
                      ),
                    );
                  },
                  itemCount: games.length,
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JambTableScreen()),
                );
              },
              child: Text("Bele a játékba"),
            ),
          ],
        ),
      ),
    );
  }
}
