import 'package:flutter/material.dart';

class JambTableHeader {
  static TableRow build() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.lightBlueAccent),
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Center(
            child: Text(
              "Játék",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Icon(Icons.keyboard_arrow_down_sharp, size: 35),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Icon(Icons.unfold_more, size: 35),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Icon(Icons.keyboard_arrow_up, size: 35),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Jelentés",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Első kézből",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
