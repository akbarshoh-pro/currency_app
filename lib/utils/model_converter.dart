
import '../data/source/model/currency_model.dart';
import '../data/source/remote/response/currency_responce.dart';

class ModelConverter {
  static CurrencyModel toUIData(CurrencyResponse response) =>
      CurrencyModel(
        id: response.id,
        code: response.code,
        ccy: response.ccy,
        ccyNmRu: response.ccyNmRu,
        ccyNmUz: response.ccyNmUz,
        ccyNmUzc: response.ccyNmUzc,
        ccyNmEn: response.ccyNmEn,
        nominal: response.nominal,
        rate: response.rate,
        diff: response.diff,
        date: response.date,
      );
}