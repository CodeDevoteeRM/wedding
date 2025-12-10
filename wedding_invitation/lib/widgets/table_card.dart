import 'package:flutter/material.dart';
import 'table_types.dart';

class TableCardWidget extends StatelessWidget {
  final TableInfo table;
  final String searchQuery;
  final bool isHighlighted;
  final ColorScheme colorScheme;
  final TableArrangementStyle style;

  const TableCardWidget({
    super.key,
    required this.table,
    required this.searchQuery,
    required this.isHighlighted,
    required this.colorScheme,
    this.style = TableArrangementStyle.elegant,
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case TableArrangementStyle.elegant:
        return _buildElegantCard();
      case TableArrangementStyle.modern:
        return _buildModernCard();
      case TableArrangementStyle.minimal:
        return _buildMinimalCard();
      case TableArrangementStyle.cards:
        return _buildCompactCard();
      default:
        return _buildElegantCard();
    }
  }

  Widget _buildElegantCard() {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: isHighlighted
              ? colorScheme.secondary
              : colorScheme.outline.withOpacity(0.1),
          width: isHighlighted ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isHighlighted
                  ? colorScheme.secondary.withOpacity(0.1)
                  : colorScheme.primary.withOpacity(0.05),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isHighlighted
                        ? colorScheme.secondary
                        : colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${table.number}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Стол ${table.number}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isHighlighted
                              ? colorScheme.secondary
                              : colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        '${table.guests.length} из ${table.capacity} мест',
                        style: TextStyle(
                          fontSize: 13,
                          color: isHighlighted
                              ? colorScheme.secondary.withOpacity(0.8)
                              : colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isHighlighted)
                  Icon(Icons.arrow_forward, color: colorScheme.secondary),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: table.guests.map((guest) {
                    final isGuestHighlighted =
                        searchQuery.isNotEmpty &&
                        guest.toLowerCase().contains(searchQuery.toLowerCase());

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle_outlined,
                            size: 18,
                            color: isGuestHighlighted
                                ? colorScheme.secondary
                                : colorScheme.primary.withOpacity(0.5),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              guest,
                              style: TextStyle(
                                fontSize: 14,
                                color: isGuestHighlighted
                                    ? colorScheme.secondary
                                    : colorScheme.onSurface.withOpacity(0.8),
                                fontWeight: isGuestHighlighted
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernCard() {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: isHighlighted
              ? colorScheme.secondary
              : colorScheme.outline.withOpacity(0.1),
          width: isHighlighted ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isHighlighted
                    ? [
                        colorScheme.secondary,
                        colorScheme.secondary.withOpacity(0.8),
                      ]
                    : [colorScheme.primary, colorScheme.secondary],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Стол ${table.number}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onPrimary,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.onPrimary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${table.guests.length}/${table.capacity}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: table.guests.map((guest) {
                    final isGuestHighlighted =
                        searchQuery.isNotEmpty &&
                        guest.toLowerCase().contains(searchQuery.toLowerCase());

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Icon(
                              Icons.person_outline,
                              size: 14,
                              color: isGuestHighlighted
                                  ? colorScheme.secondary
                                  : colorScheme.primary.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              guest,
                              style: TextStyle(
                                fontSize: 13,
                                color: isGuestHighlighted
                                    ? colorScheme.secondary
                                    : colorScheme.onSurface.withOpacity(0.8),
                                fontWeight: isGuestHighlighted
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMinimalCard() {
    // Реализация для минималистичного стиля
    return Container();
  }

  Widget _buildCompactCard() {
    // Реализация для компактных карточек
    return Container();
  }
}
