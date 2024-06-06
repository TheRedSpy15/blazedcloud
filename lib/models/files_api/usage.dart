class Usage {
  final int usage;
  final int capacity;

  Usage({
    required this.usage,
    required this.capacity,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      usage: json['usage'],
      capacity: json['capacity'],
    );
  }
}
