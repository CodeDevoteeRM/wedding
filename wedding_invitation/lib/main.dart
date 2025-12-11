import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wedding_invitation/widgets/calendar.dart' as calendar_widget;
import 'package:wedding_invitation/widgets/location_w.dart';
import 'package:wedding_invitation/widgets/main_header.dart';
import 'package:wedding_invitation/widgets/schedule_w.dart' hide ScheduleItem;
import 'package:wedding_invitation/widgets/table_arrangement.dart';
import 'types.dart';

void main() {
  runApp(const WeddingApp());
}

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Свадьба Романа и Рузанны',
      theme: ThemeData(
        fontFamily: 'Gnocchi',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF91B287), // Основной мягкий зеленый
          primary: const Color(0xFF4C6444), // Темный зеленый
          onPrimary: Colors.white,
          secondary: const Color(0xFF765B50), // Коричневый
          onSecondary: Colors.white,
          tertiary: const Color(0xFFBA9B8E), // Светлый бежевый
          surface: const Color(0xFFF8F4F0), // Светлый фон
          background: const Color(0xFFF5F0EB), // Фон
          error: const Color(0xFFD32F2F),
        ),
        useMaterial3: true,
      ),
      home: const WeddingInvitation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SaveDateWavePainter extends CustomPainter {
  final double phase;
  final Color color;

  SaveDateWavePainter({
    required this.phase,
    this.color = const Color(0xFF4C6444), // Изменен на темный зеленый
  });

  @override
  void paint(Canvas canvas, Size size) {
    const startY = 70.0;
    const fontSize = 16.0;

    final text =
        'save the date ✦ save the date ✦ save the date ✦ save the date ✦ save the date ✦ save the date ✦ save the date ✦ save the date ✦ save the date ✦ save the date ✦ save the date';

    // Используем шрифт Gnocchi
    final textStyle = TextStyle(
      fontFamily: 'Gnocchi',
      color: color.withOpacity(0.2), // Более прозрачный цвет
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      letterSpacing: 10,
    );

    // Разбиваем текст на отдельные буквы для анимации
    for (int i = 0; i < text.length; i++) {
      final letter = text[i];
      final textSpan = TextSpan(text: letter, style: textStyle);

      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      // Вычисляем базовую позицию буквы
      final baseX = i * (fontSize * 0.8);
      final baseY = startY;

      // Создаем волнообразное движение для каждой буквы
      final letterPhase = phase + i * 0.25; // Меньший шаг для плавности

      // Основная волна с УВЕЛИЧЕННОЙ амплитудой
      final mainWave = sin(letterPhase) * 8;

      // Вторичная волна для более интересного движения
      final secondaryWave = sin(letterPhase * 1.7 + 0.5) * 4;

      // Третичная волна для мелкой ряби
      final rippleWave = sin(letterPhase * 2.3 + 1.2) * 2;

      // Вертикальное смещение (вверх-вниз)
      final verticalOffset = mainWave + secondaryWave + rippleWave;

      // Горизонтальное движение - очень медленное
      final x = baseX - phase * 15;
      final y = baseY + verticalOffset;

      // Добавляем легкое масштабирование для эффекта "дыхания"
      final scale = 1.0 + sin(letterPhase * 0.8) * 0.05;

      canvas.save();
      canvas.translate(x, y);
      canvas.scale(scale); // Применяем масштабирование
      textPainter.paint(canvas, Offset.zero);
      canvas.restore();

      // Если текст ушел за левый край, начинаем его снова справа
      if (x + fontSize < 0) {
        final newX = size.width + (x % size.width);
        canvas.save();
        canvas.translate(newX, y);
        canvas.scale(scale);
        textPainter.paint(canvas, Offset.zero);
        canvas.restore();
      }
    }

    // Добавляем вторую линию ниже для большей плотности
    for (int i = 0; i < text.length; i++) {
      final letter = text[i];
      final textSpan = TextSpan(
        text: letter,
        style: textStyle.copyWith(
          color: color.withOpacity(0.1),
        ), // Еще более прозрачный
      );

      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      // Вторая линия ниже первой
      final baseX = i * (fontSize * 0.8) + fontSize * 0.4;
      final baseY = startY + 50;

      final letterPhase = phase + i * 0.3 + 1.0; // Сдвиг фазы

      // Волна для второй линии
      final mainWave = sin(letterPhase * 0.9) * 6;
      final secondaryWave = sin(letterPhase * 1.4 + 0.8) * 3;
      final verticalOffset = mainWave + secondaryWave;

      final x = baseX - phase * 12; // Другая скорость
      final y = baseY + verticalOffset;

      canvas.save();
      canvas.translate(x, y);
      textPainter.paint(canvas, Offset.zero);
      canvas.restore();

      if (x + fontSize < 0) {
        final newX = size.width + (x % size.width);
        canvas.save();
        canvas.translate(newX, y);
        textPainter.paint(canvas, Offset.zero);
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant SaveDateWavePainter oldDelegate) {
    return oldDelegate.phase != phase;
  }
}

class WeddingInvitation extends StatefulWidget {
  const WeddingInvitation({super.key});

  @override
  State<WeddingInvitation> createState() => _WeddingInvitationState();
}

class _WeddingInvitationState extends State<WeddingInvitation>
    with SingleTickerProviderStateMixin {
  final List<ScheduleItem> _scheduleItems = [
    ScheduleItem(time: '15:00', event: 'Сбор гостей', isLiked: false),
    ScheduleItem(
      time: '16:00',
      event: 'Церемония бракосочетания',
      isLiked: false,
    ),
    ScheduleItem(time: '17:00', event: 'Фуршет и фотосессия', isLiked: false),
    ScheduleItem(time: '18:30', event: 'Праздничный ужин', isLiked: false),
    ScheduleItem(time: '20:00', event: 'Первый танец молодых', isLiked: false),
    ScheduleItem(time: '21:00', event: 'Торт и поздравления', isLiked: false),
    ScheduleItem(time: '22:00', event: 'Танцы до утра', isLiked: false),
  ];

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF8F4F0), // Светлый верх
                Color(0xFFF5F0EB), // Светлый низ
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 150,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: SaveDateWavePainter(
                        phase: _animationController.value * 2 * pi,
                        color: const Color(0xFF4C6444),
                      ),
                    );
                  },
                ),
              ),
              // Основной контент
              Column(
                children: [
                  AnimatedHeaderWidget(),
                  _buildCalendarHeart(),
                  ScheduleWidget(
                    style: ScheduleStyle.elegant,
                    customTitle: 'Расписание свадебного дня',
                  ),
                  LocationWidget(style: LocationStyle.elegant),
                  TableArrangementWidget(),
                  _buildFooter(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarHeart() {
    return Column(
      children: [
        calendar_widget.CalendarWidget(
          animationController: _animationController,
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 60, left: 20, right: 20),
      child: Column(
        children: [
          Text(
            'С любовью,\nРоман и Рузанна',
            style: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.primary.withOpacity(0.7), // Более насыщенный
              fontSize: 16, // Немного больше
              height: 1.4,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
