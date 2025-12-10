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
        color: widget.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.colorScheme.outline.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: widget.colorScheme.shadow.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: widget.colorScheme.primary.withOpacity(0.7),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Поиск гостя...',
                hintStyle: TextStyle(
                  color: widget.colorScheme.onSurface.withOpacity(0.4),
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 15,
                color: widget.colorScheme.onSurface,
              ),
            ),
          ),
          if (_searchQuery.isNotEmpty)
            IconButton(
              onPressed: _clearSearch,
              icon: Icon(
                Icons.clear,
                size: 20,
                color: widget.colorScheme.onSurface.withOpacity(0.4),
              ),
            ),
        ],
      ),
    );
  }
}
