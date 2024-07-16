import 'dart:convert';

import 'package:dars_58_home/data/models/currency.dart';
import 'package:http/http.dart' as http;
class CurrencyServices{
  final _api = Uri.parse("https://cbu.uz/uz/arkhiv-kursov-valyut/json/");

  Future<List<Currency>> getAllCurrency() async{
    List<Currency> currencys = [];
    final response = await http.get(_api);
    List<dynamic> datas = jsonDecode(response.body);
    for(int i = 0; i < datas.length;i++){
      currencys.add(Currency.fromJson(datas[i]));
    }

    return currencys;
  }
}