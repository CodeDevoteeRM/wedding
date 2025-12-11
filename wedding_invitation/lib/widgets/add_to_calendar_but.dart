import 'package:flutter/material.dart';

class AddToCalendarButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddToCalendarButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          // Декоративная линия с градиентом
          Container(
            height: 1,
            width: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary.withOpacity(0.2),
                  colorScheme.secondary.withOpacity(0.4),
                  colorScheme.primary.withOpacity(0.2),
                ],
              ),
            ),
            margin: const EdgeInsets.only(bottom: 20),
          ),

          // Кнопка с новыми цветами
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(
              Icons.calendar_today, 
              size: 18,
              color: Colors.white,
            ),
            label: const Text(
              'Добавить в календарь',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary, // #4C6444
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 3,
              shadowColor: colorScheme.primary.withOpacity(0.3),
              side: BorderSide(
                color: colorScheme.primary.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Подсказка
          Text(
            'Сохраните дату свадьбы',
            style: TextStyle(
              color: colorScheme.primary.withOpacity(0.7), // #4C6444 с прозрачностью
              fontSize: 12,
              fontStyle: FontStyle.italic,
              letterSpacing: 0.5,
            ),
          ),
          
          const SizedBox(height: 10),
          
          // Дополнительный декоративный элемент
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: 10,
                color: colorScheme.secondary.withOpacity(0.6), // #765B50
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.favorite,
                size: 12,
                color: colorScheme.tertiary, // #BA9B8E
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.favorite,
                size: 10,
                color: colorScheme.secondary.withOpacity(0.6), // #765B50
              ),
            ],
          ),
        ],
      ),
    );
  }
}