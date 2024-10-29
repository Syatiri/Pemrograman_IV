import 'package:intl/intl.dart';

class Formatter {
  static final currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static final dateFormat = DateFormat('dd/MM/yyyy');

  static String formatCurrency(double value) {
    return currencyFormat.format(value);
  }

  static String formatDate(DateTime date) {
    return dateFormat.format(date);
  }
}
