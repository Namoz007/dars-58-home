import 'package:bloc/bloc.dart';
import 'package:dars_58_home/blocs/currency/currency_event.dart';
import 'package:dars_58_home/blocs/currency/currency_state.dart';
import 'package:dars_58_home/data/models/currency.dart';
import 'package:dars_58_home/data/repositories/currency_repositories.dart';

import '../../services/currency_services.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyRepositories _currencyRepositories;
  CurrencyBloc({required CurrencyRepositories repo})
      : _currencyRepositories = repo,
        super(InitialCurrencys()) {
    on<ShowAllCurrency>(_getAllCurrency);
  }

  void _getAllCurrency(ShowAllCurrency show,emit) async{
    emit(LoadingCurrencys());
    final currencys = await _currencyRepositories.getAllCurrency();
    emit(LoadedCurrencys(currencys));
  }


}
