import 'package:flutter/material.dart';

class JambTableFirstColumn extends StatelessWidget {
  final int index;

  const JambTableFirstColumn({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    const List<String> firstColumnDisplays = ["*1", "2", "3", "4", "5", "6"];

    return (index < 6)
        ? TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Text(
                firstColumnDisplays[index],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          )
        : TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Tooltip(
              message: "Bónusz 30, ha az összeg nagyobb 60-nál",
              child: Row(
                children: [
                  Text(
                    "∑",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Flexible(
                    child: Text(
                      "Bónusz 30, ha az összeg nagyobb 60-nál",
                      softWrap: true,
                      style: TextStyle(fontSize: 7),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
