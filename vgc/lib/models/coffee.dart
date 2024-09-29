class Coffee {
  final String? image;

  Coffee({
    required this.image,
  });

  static Coffee fromJson(Map<dynamic, dynamic> json) {
    return Coffee(
      image: json["file"],
    );
  }

  Map<dynamic, Object?> toJson() {
    return {
      image: image,
    };
  }
}
