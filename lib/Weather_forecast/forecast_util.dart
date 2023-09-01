import 'package:intl/intl.dart';

class Util {

  static String? appId = "ec6fe3cc1f11d5bd40bf512b2edefc6e";

  static String getFormattedDate(DateTime dateTime) {

    return new DateFormat("EEEE, MMM d, y").format(dateTime);

  }

}