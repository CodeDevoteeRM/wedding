import 'package:flutter/material.dart';
import 'table_types.dart';
import 'table_search.dart';
import 'placement_card.dart';

class TableArrangementWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final TableArrangementStyle style;
  final ColorScheme? customColorScheme;

  const TableArrangementWidget({
    super.key,
    this.title = 'Рассадка гостей',
    this.subtitle = 'Расположение по столам',
    this.style = TableArrangementStyle.elegant,
    this.customColorScheme,
  });

  @override
  State<TableArrangementWidget> createState() => _TableArrangementWidgetState();
}

class _TableArrangementWidgetState extends State<TableArrangementWidget> {
  String _searchQuery = '';
  TableInfo? _highlightedTable;

  static const List<TableInfo> _tables = [
    TableInfo(
      number: 1,
      capacity: 12,
      guests: [
        'Анна Смирнова',
        'Иван Петров',
        'Мария Иванова',
        'Сергей Сидоров',
        'Елена Кузнецова',
        'Дмитрий Волков',
        'Ольга Новикова',
        'Алексей Морозов',
      ],
    ),
    TableInfo(
      number: 2,
      capacity: 8,
      guests: [
        'Татьяна Захарова',
        'Павел Орлов',
        'Юлия Лебедева',
        'Максим Семенов',
        'Андрей Козлов',
        'Наталья Фомина',
      ],
    ),
    TableInfo(
      number: 3,
      capacity: 8,
      guests: [
        'Артем Никитин',
        'Виктория Макарова',
        'Георгий Павлов',
        'Светлана Виноградова',
        'Александр Соколов',
        'Ирина Попова',
      ],
    ),
    TableInfo(
      number: 4,
      capacity: 10,
      guests: [
        'Василий Михайлов',
        'Людмила Федорова',
        'Константин Алексеев',
        'Екатерина Андреева',
        'Олег Тимофеев',
        'Алина Сергеева',
      ],
    ),
    TableInfo(
      number: 5,
      capacity: 8,
      guests: [
        'Роман Громов',
        'Дарья Ковалева',
        'Станислав Белов',
        'Валентина Комарова',
        'Никита Егоров',
        'Ангелина Медведева',
      ],
    ),
    TableInfo(
      number: 6,
      capacity: 8,
      guests: [
        'Владислав Соловьев',
        'Полина Петрова',
        'Тимур Васильев',
        'Кристина Зайцева',
        'Галина Морозова',
        'Борис Волков',
      ],
    ),
    TableInfo(
      number: 7,
      capacity: 12,
      guests: [
        'Лариса Семенова',
        'Федор Лебедев',
        'Зинаида Козлова',
        'Григорий Новиков',
        'Раиса Петрова',
        'Виталий Смирнов',
      ],
    ),
    TableInfo(
      number: 8,
      capacity: 6,
      guests: [
        'Нина Федорова',
        'Игорь Михайлов',
        'Римма Николаева',
        'Семен Кузнецов',
        'Любовь Соколова',
      ],
    ),
  ];

  ColorScheme _getColorScheme(BuildContext context) {
    return widget.customColorScheme ?? Theme.of(context).colorScheme;
  }

  List<TableInfo> get _filteredTables {
    if (_searchQuery.isEmpty) return _tables;

    return _tables.where((table) {
      return table.number.toString().contains(_searchQuery) ||
          table.guests.any(
            (guest) => guest.toLowerCase().contains(_searchQuery.toLowerCase()),
          );
    }).toList();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;

      if (query.isNotEmpty) {
        for (final table in _tables) {
          if (table.number.toString().contains(query) ||
              table.guests.any(
                (guest) => guest.toLowerCase().contains(query.toLowerCase()),
              )) {
            _highlightedTable = table;
            return;
          }
        }
      }

      _highlightedTable = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = _getColorScheme(context);
    final filteredTables = _filteredTables;

    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Заголовок
          Container(
            margin: const EdgeInsets.only(bottom: 24),
            child: Column(
              children: [
                Icon(
                  Icons.people_alt_rounded,
                  color: const Color(0xFF4C6444),
                  size: 36,
                ),
                const SizedBox(height: 12),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4C6444),
                    letterSpacing: 0.5,
                    fontFamily: 'Gnocchi',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color(0xFF4C6444).withOpacity(0.7),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          // Поисковая строка
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: TableSearchWidget(
              tables: _tables,
              onSearchChanged: _onSearchChanged,
              colorScheme: colorScheme,
            ),
          ),

          const SizedBox(height: 24),
          // Сетка столов с использованием TablesGridWidget
          TablesGridWidget(
            tables: filteredTables,
            searchQuery: _searchQuery,
            colorScheme: colorScheme,
            style: widget.style,
          ),
        ],
      ),
    );
  }

  Widget _buildTotalItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: color,
            fontFamily: 'Gnocchi',
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: color.withOpacity(0.7)),
        ),
      ],
    );
  }
}
