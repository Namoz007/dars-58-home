import 'package:bloc/bloc.dart';
import 'package:dars_58_home/blocs/currency/currency_bloc.dart';

class CurrencyBoserver extends BlocObserver{
  void onChanget(CurrencyBloc bloc,Change change){
    super.onChange(bloc, change);

    print("${bloc.runtimeType} o'zgarmqoda ${change}");
  }

  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}