class CustomError extends Error {
  final String message;

  CustomError({required this.message});

  String getError() {
    RegExp regex = RegExp(r'Error: (.+?)\s*,\s*errno =');
    Match? match = regex.firstMatch(message);

    if (match != null) {
      return "${match.group(1)}";
    } else {
      return message;
    }
  }
}
