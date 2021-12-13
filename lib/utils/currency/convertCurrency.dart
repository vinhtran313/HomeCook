import 'package:intl/intl.dart';

class CurrencyUtils {
  static String covertCurrency(double currency) {
    final oCcy = new NumberFormat("#,##0.00", "en_US");
    return oCcy.format(currency);
  }
}
