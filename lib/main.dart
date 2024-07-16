import 'package:dars_58_home/blocs/currency/currency_bloc.dart';
import 'package:dars_58_home/data/repositories/currency_repositories.dart';
import 'package:dars_58_home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => CurrencyRepositories()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CurrencyBloc(repo: context.read<CurrencyRepositories>())),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen()
        ),
      ),
    );
  }
}
