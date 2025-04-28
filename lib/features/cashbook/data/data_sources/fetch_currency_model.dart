import '../../../../core/constants/app_values.dart';
import '../models/currency_model.dart';

List<CurrencyModel> getCurrencyModels() {
  return AppValues.currencies.map((currency) {
    return CurrencyModel(
      code: currency['code'] ?? '',
      name: currency['name'] ?? '',
      symbol: currency['symbol'] ?? '',
    );
  }).toList();
}
