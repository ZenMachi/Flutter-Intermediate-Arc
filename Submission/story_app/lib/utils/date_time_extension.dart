
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  toIndFormat() {
    return DateFormat('dd MMM yyyy', 'id_ID').format(this);
  }
  toDateAndTime() {
    return DateFormat('dd MMM yyyy - hh:mm', 'id_ID').format(this);
  }
}