import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  toDate() {
    return DateFormat('dd MMMM yyyy').format(this);
  }

  toDateAndTime() {
    return DateFormat('dd MMMM yyyy - hh:mm').format(this);
  }
}
