

import 'package:dio/dio.dart';

import '../../response/currency_responce.dart';
import '../api_currency.dart';

class ApiCurrencyImp extends ApiCurrency {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://cbu.uz/uz/',
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    contentType: 'application/json',
  ));

  @override
  Future<List<CurrencyResponse>> getAllCurrencies() async {
    try {
      var response = await _dio.get('arkhiv-kursov-valyut/json/');
      return (response.data as List)
          .map((value) => CurrencyResponse.fromJson(value))
          .toList();
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<CurrencyResponse>> getAllByDate(String date) async {
    try {
      var response = await _dio.get('arkhiv-kursov-valyut/json/all/$date/');
      return (response.data as List)
          .map((value) => CurrencyResponse.fromJson(value))
          .toList();
    } on DioException {
      rethrow;
    }
  }
}