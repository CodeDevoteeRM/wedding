import 'package:flutter/material.dart';
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
        fontFamily: 'Playfair',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE8F4F8),
          primary: const Color(0xFF2C3E50),
          secondary: const Color(0xFFC19A6B),
        ),
        useMaterial3: true,
      ),
      home: const WeddingInvitation(),
    );
  }
}

class WeddingInvitation extends StatefulWidget {
  const WeddingInvitation({super.key});

  @override
  State<WeddingInvitation> createState() => _WeddingInvitationState();
}

class _WeddingInvitationState extends State<WeddingInvitation> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8F4F8), Color(0xFFB8D8E8)],
          ),
        ),
        child: ListView(
          children: [
            _buildHeader(),
            _buildMainCard(),
            _buildPhotoGallery(),
            _buildSchedule(),
            _buildDetails(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Приглашение на свадьбу',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w300,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 1,
            width: 100,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildMainCard() {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              'Роман & Рузанна',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w400,
                fontSize: 36,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '17 января 2026',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoGallery() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            'Наши моменты',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo_camera,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 50,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Фото 1',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo_camera,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 50,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Фото 2',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSchedule() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Расписание дня',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Отметьте сердечком события, которые особенно ждете!',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ..._scheduleItems.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return _buildScheduleItem(item, index);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleItem(ScheduleItem item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            width: 70,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              item.time,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              item.event,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                _scheduleItems[index] = item.copyWith(isLiked: !item.isLiked);
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: item.isLiked
                    ? Theme.of(context).colorScheme.secondary.withOpacity(0.2)
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                item.isLiked ? Icons.favorite : Icons.favorite_border,
                color: item.isLiked
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary.withOpacity(0.5),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailItem('Где', 'Ресторан «Зимний сад»\nул. Снежная, 25'),
          _buildDetailItem('Дресс-код', 'Вечерние наряды в зимней гамме'),
          _buildDetailItem(
            'Контакты',
            '+7 XXX XXX-XX-XX\nroma_ruzanna@wedding.ru',
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Text(
            '«Самые прекрасные истории начинаются зимой»',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          FilledButton(
            onPressed: () {
              _showConfirmationDialog();
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Text(
              'Подтвердить присутствие',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog() {
    final likedEvents = _scheduleItems.where((item) => item.isLiked).toList();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Спасибо за подтверждение!',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          content: likedEvents.isEmpty
              ? const Text('Ждем вас на нашей свадьбе!')
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Мы заметили, что вы особенно ждете:'),
                    const SizedBox(height: 10),
                    ...likedEvents
                        .map(
                          (event) => Text('• ${event.time} - ${event.event}'),
                        )
                        .toList(),
                  ],
                ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Закрыть'),
            ),
          ],
        );
      },
    );
  }
}
