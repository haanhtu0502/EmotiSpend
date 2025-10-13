extension DoubleExtension on double {
  String formatMoney() {
    if (this >= 1000000000) {
      // Tỷ (Billion)
      return '${(this / 1000000000).toStringAsFixed(this % 1000000000 == 0 ? 0 : 2)}B';
    } else if (this >= 1000000) {
      // Triệu (Million)
      return '${(this / 1000000).toStringAsFixed(this % 1000000 == 0 ? 0 : 2)}M';
    } else if (this >= 1000) {
      // Nghìn (K)
      return '${(this / 1000).toStringAsFixed(this % 1000 == 0 ? 0 : 0)}K';
    } else {
      // Dưới 1000
      return toStringAsFixed(0);
    }
  }
}
