
import 'package:dio/dio.dart';

import '../../data/source/model/currency_model.dart';
import '../../data/source/remote/service/api_currency.dart';
import '../../data/source/remote/service/impl/api_currency_imp.dart';
import '../../utils/model_converter.dart';
import '../app_repository.dart';

class AppRepositoryImp extends AppRepository {
  final ApiCurrency _currency = ApiCurrencyImp();

  @override
  Future<List<CurrencyModel>> getAllCurrencies() async {
    try {
      var response = await _currency.getAllCurrencies();
      return response.map((value) => ModelConverter.toUIData(value)).toList();
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<CurrencyModel>> getAllByDate(String date) async {
    try {
      var list = await _currency.getAllByDate(date);
      return list
          .map((value) => ModelConverter
          .toUIData(value)).toList();
    } on DioException {
      rethrow;
    }
  }
}