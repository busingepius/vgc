class Coffee {
   String? image;

  Coffee({required this.image});

  Coffee.withImage({
    required this.image,
  });

  static Coffee fromJson(Map<dynamic, dynamic> json) {
    return Coffee.withImage(
      image: json["file"],
    );
  }

  Map<dynamic, Object?> toJson() {
    return {
      image: image,
    };
  }
}
