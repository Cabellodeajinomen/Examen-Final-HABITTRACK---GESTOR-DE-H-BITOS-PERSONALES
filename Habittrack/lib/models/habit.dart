class Habit {
  final String id;
  final String title;
  final String subtitle;
  bool isCompleted;

  Habit({
    required this.id,
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
  });
}
