import 'package:dars_58_home/data/models/currency.dart';

sealed class CurrencyState{}

final class InitialCurrencys extends CurrencyState{}

final class LoadingCurrencys extends CurrencyState{}

final class LoadedCurrencys extends CurrencyState{
  List<Currency> currencys = [];

  LoadedCurrencys(this.currencys);
}

final class ErrorCurrency extends CurrencyState{}

final class CalculateCurrencyState extends CurrencyState{}