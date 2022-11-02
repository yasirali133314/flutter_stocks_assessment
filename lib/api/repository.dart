import 'package:flutter_stocks_assessment/api/api_provider.dart';
import 'package:flutter_stocks_assessment/api/base_api.dart';
import 'package:flutter_stocks_assessment/api/exception/api_exception.dart';
import 'package:flutter_stocks_assessment/models/company_stocks_response.dart';
import 'package:flutter_stocks_assessment/models/stocks_company_response.dart';
import 'package:flutter_stocks_assessment/models/stocks_response.dart';

class DataRepository extends BaseApi {
  final ApiProvider _apiProvider = ApiProvider();

  Future<dynamic> getStocks({String? dateFrom, String? dateTo}) async {
    var url = getStocksUrl(dateFrom: dateFrom, dateTo: dateTo);
    var stocksResponse = await _apiProvider.makeGetRequest(url);
    if (stocksResponse == null) {
      return null;
    }
    if (stocksResponse is ApiException) {
      return CompanyStocksResponse(
          success: false, message: stocksResponse.message);
    }
    var stocks = CompanyStocksResponse.fromJson(stocksResponse);
    stocks.success = true;
    return stocks;
  }

// currently no usage
// Future<dynamic> fetchStocksForSymbol(String symbol) async {
//   var url = '${BASE_URL}tickers/$symbol/splits?access_key=$API_KEY&date_from=2022-10-29&date_to=2022-11-01';
//   var stocksResponse = await _apiProvider.makeGetRequest(url);
//   if (stocksResponse == null) {
//     return null;
//   }
//   if (stocksResponse is ApiException) {
//     return StocksResponse(success: false, message: stocksResponse.message);
//   }
//   var stocks = StocksResponse.fromJson(stocksResponse);
//   stocks.success = true;
//   return stocks;
// }
}
