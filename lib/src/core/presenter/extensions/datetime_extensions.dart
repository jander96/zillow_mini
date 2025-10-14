import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  /// Returns a formatted date like: `Oct 13, 2025`
  String get toShortDate => DateFormat('MMM d, yyyy').format(this);
  String get toLongDate => DateFormat('dd MMM yyyy, HH:mm').format(this);
}