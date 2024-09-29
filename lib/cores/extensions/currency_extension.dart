import 'package:intl/intl.dart';

extension NumCurrencyExtension on num {
  String toIdr() {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id-ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(this);
  }
}
