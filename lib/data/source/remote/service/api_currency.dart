

import '../response/currency_responce.dart';

abstract class ApiCurrency {
  Future<List<CurrencyResponse>> getAllCurrencies();
  Future<List<CurrencyResponse>> getAllByDate(String date);
}