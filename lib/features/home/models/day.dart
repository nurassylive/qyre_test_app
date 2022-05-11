class Day {
  final String time;
  final bool? active;

  Day({
    required this.time,
    this.active,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      time: json['time'] ?? DateTime.now(),
      active: json['active'],
    );
  }
}
