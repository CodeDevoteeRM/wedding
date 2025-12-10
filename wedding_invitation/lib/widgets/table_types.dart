class TableInfo {
  final int number;
  final int capacity;
  final List<String> guests;

  const TableInfo({
    required this.number,
    required this.capacity,
    required this.guests,
  });
}

enum TableArrangementStyle {
  elegant, // Элегантный
  modern, // Современный
  minimal, // Минималистичный
  cards, // Компактные карточки
  search, // Для поиска
}
