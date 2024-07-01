


import '../data/source/model/currency_model.dart';

abstract class AppRepository {
  Future<List<CurrencyModel>> getAllCurrencies();
  Future<List<CurrencyModel>> getAllByDate(String date);
}