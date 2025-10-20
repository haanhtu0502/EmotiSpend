import 'package:emoti_spend/mvvm/data/enum/jar.dart';

class JarAmountItem {
  final Jar jar;
  final double amount;
  final int percent;

  const JarAmountItem({
    required this.jar,
    required this.amount,
    required this.percent,
  });

  JarAmountItem copyWith({Jar? jar, double? amount, int? percent}) {
    return JarAmountItem(
      jar: jar ?? this.jar,
      amount: amount ?? this.amount,
      percent: percent ?? this.percent,
    );
  }
}
