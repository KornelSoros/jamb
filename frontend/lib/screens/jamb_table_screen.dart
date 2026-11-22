import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/dice_screen.dart';
import 'package:frontend/services/game_service.dart';
import 'package:frontend/widgets/jamb_table_first_column.dart';

import '../models/game.dart';
import '../widgets/jamb_table_header.dart';

class JambTableScreen extends StatefulWidget {
  final int gameId;
  final List<int?>? diceValues;

  const JambTableScreen({super.key, required this.gameId, this.diceValues});

  @override
  State<JambTableScreen> createState() => _JambTableScreenState();
}

class _JambTableScreenState extends State<JambTableScreen> {
  late Game? game;

  Future<void> initDatas() async {
    game = await GameService.getGameById(id: widget.gameId);
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => await initDatas(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.diceValues != null) widget.diceValues!.sort();

    const int _numberOfColumns = 5;
    Map<int, TableColumnWidth> columnWidths = {};

    for (int i = 1; i < _numberOfColumns; i++) {
      columnWidths.addAll({i: FixedColumnWidth(60)});
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Jamb")),
        // automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (widget.diceValues != null) ...[
              Text(
                "Ezeket dobtad: ${widget.diceValues!.join(" ")}",
                style: TextStyle(fontSize: 20),
              ),
              Text("Válaszd ki azt a cellát, ahová írni szeretnéd"),
            ],

            if (widget.diceValues == null)
              ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DiceScreen(gameId: widget.gameId),
                  ),
                ),
                label: Text("Új dobás"),
                icon: Icon(Icons.casino),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                columnWidths: columnWidths,
                border: TableBorder.all(color: Colors.blue.shade900),
                children: [
                  JambTableHeader.build(),
                  for (int i = 0; i < 6; i++)
                    TableRow(
                      decoration: BoxDecoration(
                        color: i == 6
                            ? Colors.lightBlueAccent.shade100
                            : Colors.white,
                      ),
                      children: [
                        JambTableFirstColumn(index: i),

                        for (int j = 0; j < _numberOfColumns; j++)
                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              enabled: false,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              initialValue: game!.tableValues[i][j],

                              onTap: () {},

                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                              ],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
