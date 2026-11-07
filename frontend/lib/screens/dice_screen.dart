import 'package:flutter/material.dart';
import 'package:frontend/screens/jamb_table_screen.dart';
import 'package:roll_dice_2d/roll_dice_2d.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  List<UniqueKey?> diceKeys = [null, null, null, null, null];
  List<int?> diceValues = [null, null, null, null, null];
  int diceRolls = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dobás")),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text("Ennyi dobásnál jársz: $diceRolls/3"),
            if (diceRolls == 3)
              Text(
                "Megvolt a 3 dobásod! Lépj vissza a táblázatba, hogy beírd az eredményt",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            Spacer(),
            Column(
              children: [
                for (int i = 0; i < 5; i++)
                  if (diceKeys[i] != null) ...[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: (i % 2 == 0)
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: SizedBox(
                          width: 90,
                          height: 90,
                          child: RollDice2D(
                            key: diceKeys[i],
                            color: DiceColor.red,
                            rollingTimes: 8,
                            // speed: 100,
                            onRoll: (int value) {
                              setState(() {
                                diceValues[i] = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
              ],
            ),

            if (diceRolls == 0)
              Text("Még nem dobtál! Dobj, hogy láthasd az értékeket"),

            Spacer(),

            Center(
              child: ElevatedButton.icon(
                onPressed: (diceRolls < 3)
                    ? () {
                        setState(() {
                          for (int i = 0; i < 5; i++) {
                            diceKeys[i] = UniqueKey();
                          }
                          diceRolls++;
                        });
                      }
                    : null,
                label: Text("Új érték dobása"),
                icon: Icon(Icons.casino_outlined),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
              ),
            ),

            Center(
              child: ElevatedButton.icon(
                onPressed: (diceRolls == 3)
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                JambTableScreen(diceValues: diceValues),
                          ),
                        );
                      }
                    : null,
                label: Text("Vissza a táblázathoz"),
                icon: Icon(Icons.view_comfortable),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
