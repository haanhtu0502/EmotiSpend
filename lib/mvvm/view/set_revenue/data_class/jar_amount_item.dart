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
}
