import 'package:dars_58_home/blocs/currency/currency_bloc.dart';
import 'package:dars_58_home/blocs/currency/currency_event.dart';
import 'package:dars_58_home/blocs/currency/currency_state.dart';
import 'package:dars_58_home/data/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculateCurrency extends StatefulWidget {
  Currency currency;
  CalculateCurrency({super.key, required this.currency});

  @override
  State<CalculateCurrency> createState() => _CalculateCurrencyState();
}

class _CalculateCurrencyState extends State<CalculateCurrency> {
  final _sumController = TextEditingController();
  String? error;
  double sum = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("${widget.currency.countryCurrency}"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (value == null || value.isEmpty) {
                setState(() {
                  sum = 0;
                });
              } else {
                try {
                  sum = double.parse(value) / widget.currency.rate;
                  setState(() {});
                } catch (e) {
                  setState(() {
                    error = "Iltimos raqamlar bilan qiymat kiriting";
                  });
                }
              }
            },
            controller: _sumController,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              hintText: "0",
              errorText: error,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "${sum} ~ ${widget.currency.countryCurrency}",
            style: TextStyle(),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"))
      ],
    );
  }
}
