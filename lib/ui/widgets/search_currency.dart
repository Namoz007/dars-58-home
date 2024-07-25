import 'package:dars_58_home/data/models/currency.dart';
import 'package:dars_58_home/ui/widgets/calculate_currency.dart';
import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  final List<Currency> data;

  MySearchDelegate(this.data
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = data.where((element) => element.countryCurrency.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].countryCurrency),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = data.where((element) => element.countryCurrency.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].countryCurrency),
          onTap: () {
            showDialog(context: context, builder: (context) => CalculateCurrency(currency: suggestions[index]));
            showResults(context);
          },
        );
      },
    );
  }
}