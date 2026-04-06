class AppVersionComparator {
  const AppVersionComparator._();

  static int compare(String left, String right) {
    final leftParts = _normalize(left);
    final rightParts = _normalize(right);
    final maxLength = leftParts.length > rightParts.length
        ? leftParts.length
        : rightParts.length;

    for (var index = 0; index < maxLength; index++) {
      final leftValue = index < leftParts.length ? leftParts[index] : 0;
      final rightValue = index < rightParts.length ? rightParts[index] : 0;

      if (leftValue != rightValue) {
        return leftValue.compareTo(rightValue);
      }
    }

    return 0;
  }

  static List<int> _normalize(String version) {
    return version
        .trim()
        .split(RegExp(r'[^\d]+'))
        .where((part) => part.isNotEmpty)
        .map(int.parse)
        .toList(growable: false);
  }
}
