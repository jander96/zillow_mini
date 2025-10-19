import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension CurrencyFormatting on num {
  String get toUSD =>
      NumberFormat.currency(locale: 'en_US', symbol: '\$').format(this);

  String  localizePrice(BuildContext context) {
    final symbolMap = {
      'en': '\$',
      'es': '€'
    };
    return NumberFormat.currency(
        locale: Localizations.localeOf(context).toString(),
        symbol: symbolMap[Localizations.localeOf(context).languageCode] ,
        decimalDigits: 2
    ).format(this)
    ;

  }
}