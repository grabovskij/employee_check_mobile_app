import 'package:intl/intl.dart';

String dateFormatyMMMMEEEEd(DateTime dateTime) {
  return DateFormat('yMMMMEEEEd').format(dateTime);
}
