sealed class CurrencyEvent {}

class CalculateCurrencyForSum extends CurrencyEvent {
  double sum;
  double rate;

  CalculateCurrencyForSum({
    required this.sum,
    required this.rate,
  });
}


class ShowAllCurrency extends CurrencyEvent{}
