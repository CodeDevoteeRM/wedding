class ScheduleItem {
  final String time;
  final String event;
  final bool isLiked;

  ScheduleItem({
    required this.time,
    required this.event,
    required this.isLiked,
  });

  ScheduleItem copyWith({String? time, String? event, bool? isLiked}) {
    return ScheduleItem(
      time: time ?? this.time,
      event: event ?? this.event,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
