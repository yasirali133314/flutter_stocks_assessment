class BaseApi {
  String get _BASE_URL => 'http://api.marketstack.com/v1/';

  String get _API_KEY => '2fb2d7aae519aac92d1adcf178998d2c';

  String get _GET_STOCKS_URL =>
      '${_BASE_URL}eod?access_key=$_API_KEY&symbols=AAPL,MSFT,AMZN,TSLA,NVDA,GOOGL,AMD,INTC,CSCO,PYPL';

  String getStocksUrl({String? dateFrom, String? dateTo}) {
    var url = _GET_STOCKS_URL;
    if (dateFrom != null && dateTo != null) {
      url = '$url&date_from=$dateFrom&date_to=$dateTo';
    }
    return url;
  }
// String get GET_STOCKS_URL =>
//     '${BASE_URL}tickers?access_key=$API_KEY&symbols=AAPL';

// String get GET_STOCKS_DETAIL_URL =>
//     '${BASE_URL}tickers?access_key=$API_KEY&symbols=AAPL,MSFT,AMZN,TSLA,NVDA,GOOGL,AMD,INTC,CSCO,PYPL&limit=10';
}
