import 'package:flutter/material.dart';
import 'table_types.dart';

class TableSearchWidget extends StatefulWidget {
  final List<TableInfo> tables;
  final Function(String) onSearchChanged;
  final ColorScheme colorScheme;

  const TableSearchWidget({
    super.key,
    required this.tables,
    required this.onSearchChanged,
    required this.colorScheme,
  });

  @override
  State<TableSearchWidget> createState() => _TableSearchWidgetState();
}

class _TableSearchWidgetState extends State<TableSearchWidget> {
  final TextEditingController _controller = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
    widget.onSearchChanged(query);
  }

  void _clearSearch() {
    _controller.clear();
    _onSearchChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF4C6444).withOpacity(0.2), // Темный зеленый
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4C6444).withOpacity(0.05), // Темный зеленый
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: const Color(0xFF4C6444), // Темный зеленый
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Поиск гостя...',
                hintStyle: TextStyle(
                  color: const Color(
                    0xFF4C6444,
                  ).withOpacity(0.4), // Темный зеленый
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF4C6444), // Темный зеленый
              ),
            ),
          ),
          if (_searchQuery.isNotEmpty)
            IconButton(
              onPressed: _clearSearch,
              icon: Icon(
                Icons.clear,
                size: 20,
                color: const Color(
                  0xFF4C6444,
                ).withOpacity(0.4), // Темный зеленый
              ),
            ),
        ],
      ),
    );
  }
}
