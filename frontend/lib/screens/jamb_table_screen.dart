import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/dice_screen.dart';
import 'package:frontend/widgets/jamb_table_first_column.dart';

import '../widgets/jamb_table_header.dart';

class JambTableScreen extends StatelessWidget {
  final List<int?>? diceValues;

  const JambTableScreen({super.key, this.diceValues});

  @override
  Widget build(BuildContext context) {
    if (diceValues != null) diceValues!.sort();

    const int _numberOfColumns = 5;
    Map<int, TableColumnWidth> columnWidths = {};

    for (int i = 1; i < _numberOfColumns; i++) {
      columnWidths.addAll({i: FixedColumnWidth(60)});
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Jamb")),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (diceValues != null) ...[
              Text(
                "Ezeket dobtad: ${diceValues!.join(" ")}",
                style: TextStyle(fontSize: 20),
              ),
              Text("Válaszd ki azt a cellát, ahová írni szeretnéd"),
            ],

            if (diceValues == null)
              ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiceScreen()),
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
                  for (int i = 0; i < 7; i++)
                    TableRow(
                      decoration: BoxDecoration(
                        color: i == 6
                            ? Colors.lightBlueAccent.shade100
                            : Colors.white,
                      ),
                      children: [
                        JambTableFirstColumn(index: i),

                        for (int j = 1; j < _numberOfColumns + 1; j++)
                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              enabled: false,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              initialValue: (j == 2 && i < 6) ? "5" : null,

                              onTap: () {},

                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                              ],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    ((j == 1 && i < 1) ||
                                        (j == 2 && i < 6) ||
                                        (j == 3 && i == 5))
                                    ? Colors.green
                                    : Colors.white,
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
