import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/widgets/jamb_table_header.dart';

void main() {
  runApp(MaterialApp(home: JambTable()));
}

class JambTable extends StatelessWidget {
  const JambTable({super.key});

  @override
  Widget build(BuildContext context) {
    const int _numberOfColumns = 5;
    const List<String> firstColumnDisplays = ["*1", "2", "3", "4", "5", "6"];
    Map<int, TableColumnWidth> columnWidths = {};

    for (int i = 1; i < _numberOfColumns; i++) {
      columnWidths.addAll({i: FixedColumnWidth(60)});
    }

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Jamb"))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            columnWidths: columnWidths,
            border: TableBorder.all(color: Colors.blue.shade900),
            children: [
              JambTableHeader.build(),
              for (int i = 0; i < 7; i++)
                TableRow(
                  children: [
                    if (i < 6)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                          child: Text(
                            firstColumnDisplays[i],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    if (i == 6)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Row(
                          children: [
                            Text(
                              "∑",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
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
                    for (int j = 1; j < _numberOfColumns + 1; j++)
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,

                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
