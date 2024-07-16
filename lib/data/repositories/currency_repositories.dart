import 'package:dars_58_home/data/models/currency.dart';
import 'package:dars_58_home/services/currency_services.dart';

class CurrencyRepositories{
  final _currencyServices = CurrencyServices();

  Future<List<Currency>> getAllCurrency() async{
    final data = await _currencyServices.getAllCurrency();
    return data;
  }
}