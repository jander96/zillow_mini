import 'package:intl/intl.dart';

extension CurrencyFormatting on num {
  String get toUSD =>
      NumberFormat.currency(locale: 'en_US', symbol: '\$').format(this);
}