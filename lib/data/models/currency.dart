class Currency {
  int id;
  String countryCurrency;
  String countryName;
  int nominal;
  double rate;

  Currency({
    required this.id,
    required this.countryCurrency,
    required this.countryName,
    required this.nominal,
    required this.rate,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['id'] as int,
      countryCurrency: json['Ccy'],
      countryName: json['CcyNm_UZ'],
      nominal: int.parse(json['Nominal']),
      rate: double.parse(json['Rate']),
    );
  }
}
