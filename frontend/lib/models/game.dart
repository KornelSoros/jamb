class Game {
  final int id;

  final List tableValues;

  const Game({required this.id, required this.tableValues});

  Map<String, dynamic> toMap() {
    return {'id': this.id, 'table_values': this.tableValues};
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(id: map['id'] as int, tableValues: map['table_values'] as List);
  }
}
