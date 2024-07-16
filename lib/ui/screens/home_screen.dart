import 'package:dars_58_home/blocs/currency/currency_bloc.dart';
import 'package:dars_58_home/blocs/currency/currency_event.dart';
import 'package:dars_58_home/blocs/currency/currency_state.dart';
import 'package:dars_58_home/services/currency_services.dart';
import 'package:dars_58_home/ui/widgets/calculate_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _currencyServices = CurrencyServices();
  @override
  Widget build(BuildContext context) {
    _currencyServices.getAllCurrency();
    return Scaffold(
      body: BlocBuilder<CurrencyBloc,CurrencyState>(
        builder: (context,state){
          print(state);
          if(state is InitialCurrencys){
            return Center(child: ElevatedButton(onPressed: (){
              context.read<CurrencyBloc>().add(ShowAllCurrency());
            },child: const Text("Valyutalar kursini ko'rish"),),);
          }

          if(state is LoadingCurrencys){
            return const Center(child: CircularProgressIndicator(color: Colors.red,),);
          }

          if(state is ErrorCurrency){
            return const Center(child: Text("Kechirasiz malumot olishda xatolik yuzaga keldi"),);
          }

          if(state is LoadedCurrencys){
            return ListView.builder(
              itemCount: state.currencys.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text("${state.currencys[index].countryCurrency} -- ${state.currencys[index].countryName} || ${state.currencys[index].rate}"),
                  trailing: InkWell(
                    onTap: (){
                      showDialog(context: context, builder: (context) => CalculateCurrency(currency: state.currencys[index],));
                    },
                    child: Icon(Icons.calculate),
                  ),
                );
              },);
          }

          return Container();
        },
      )
    );
  }
}
