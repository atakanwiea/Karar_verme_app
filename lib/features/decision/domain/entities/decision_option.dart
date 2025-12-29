class DecisionOption {
  final String id;
  final String title;
  final double weight; // 1.0 is default/normal weight

  DecisionOption({
    required this.id,
    required this.title,
    this.weight = 1.0,
  });

  // CopyWith method for immutability and updates
  DecisionOption copyWith({
    String? id,
    String? title,
    double? weight,
  }) {
    return DecisionOption(
      id: id ?? this.id,
      title: title ?? this.title,
      weight: weight ?? this.weight,
    );
  }
}
