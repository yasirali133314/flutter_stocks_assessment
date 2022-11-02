import 'dart:convert';

/// pagination : {"limit":10,"offset":0,"count":10,"total":252}
/// data : [{"open":155.08,"high":155.45,"low":149.14,"close":150.65,"volume":80379345.0,"adj_high":155.45,"adj_low":149.13,"adj_close":150.65,"adj_open":155.08,"adj_volume":80379345.0,"split_factor":1.0,"dividend":0.0,"symbol":"AAPL","exchange":"XNAS","date":"2022-11-01T00:00:00+0000"},{"open":153.16,"high":154.24,"low":151.92,"close":153.34,"volume":97848900.0,"adj_high":154.24,"adj_low":151.92,"adj_close":153.34,"adj_open":153.155,"adj_volume":97943171.0,"split_factor":1.0,"dividend":0.0,"symbol":"AAPL","exchange":"XNAS","date":"2022-10-31T00:00:00+0000"},{"open":148.2,"high":157.5,"low":147.82,"close":155.74,"volume":164659100.0,"adj_high":157.5,"adj_low":147.82,"adj_close":155.74,"adj_open":148.2,"adj_volume":164762371.0,"split_factor":1.0,"dividend":0.0,"symbol":"AAPL","exchange":"XNAS","date":"2022-10-28T00:00:00+0000"},{"open":148.07,"high":149.05,"low":144.13,"close":144.8,"volume":108284100.0,"adj_high":149.046,"adj_low":144.13,"adj_close":144.8,"adj_open":148.07,"adj_volume":109180150.0,"split_factor":1.0,"dividend":0.0,"symbol":"AAPL","exchange":"XNAS","date":"2022-10-27T00:00:00+0000"},{"open":150.96,"high":151.99,"low":148.04,"close":149.35,"volume":88194300.0,"adj_high":151.99,"adj_low":148.04,"adj_close":149.35,"adj_open":150.96,"adj_volume":88436172.0,"split_factor":1.0,"dividend":0.0,"symbol":"AAPL","exchange":"XNAS","date":"2022-10-26T00:00:00+0000"},{"open":150.09,"high":152.49,"low":149.36,"close":152.34,"volume":74373600.0,"adj_high":152.49,"adj_low":149.36,"adj_close":152.34,"adj_open":150.09,"adj_volume":74732290.0,"split_factor":1.0,"dividend":0.0,"symbol":"AAPL","exchange":"XNAS","date":"2022-10-25T00:00:00+0000"},{"open":147.19,"high":150.23,"low":146.0,"close":149.45,"volume":75904300.0,"adj_high":150.23,"adj_low":146.0,"adj_close":149.45,"adj_open":147.185,"adj_volume":75981918.0,"split_factor":1.0,"dividend":0.0,"symbol":"AAPL","exchange":"XNAS","date":"2022-10-24T00:00:00+0000"},{"open":142.87,"high":147.85,"low":142.65,"close":147.27,"volume":86464700.0,"adj_high":147.8479,"adj_low":142.649,"adj_close":147.27,"adj_open":142.87,"adj_volume":86548609.0,"split_factor":1.0,"dividend":0.0,"symbol":"AAPL","exchange":"XNAS","date":"2022-10-21T00:00:00+0000"},{"open":143.02,"high":145.89,"low":142.65,"close":143.39,"volume":64406600.0,"adj_high":145.89,"adj_low":142.65,"adj_close":143.39,"adj_open":143.02,"adj_volume":64521989.0,"split_factor":1.0,"dividend":0.0,"symbol":"AAPL","exchange":"XNAS","date":"2022-10-20T00:00:00+0000"},{"open":141.69,"high":144.95,"low":141.5,"close":143.86,"volume":61655900.0,"adj_high":144.9492,"adj_low":141.5,"adj_close":143.86,"adj_open":141.69,"adj_volume":61758340.0,"split_factor":1.0,"dividend":0.0,"symbol":"AAPL","exchange":"XNAS","date":"2022-10-19T00:00:00+0000"}]

CompanyStocksResponse companyStocksResponseFromJson(String str) =>
    CompanyStocksResponse.fromJson(json.decode(str));

String companyStocksResponseToJson(CompanyStocksResponse data) =>
    json.encode(data.toJson());

class CompanyStocksResponse {
  CompanyStocksResponse(
      {Pagination? pagination,
      List<StockData>? data,
      this.success = false,
      this.message = ''}) {
    _pagination = pagination;
    _data = data;
  }

  CompanyStocksResponse.fromJson(dynamic json) {
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(StockData.fromJson(v));
      });
    }
  }

  Pagination? _pagination;
  List<StockData>? _data;
  String message = '';
  bool success = false;

  Pagination? get pagination => _pagination;

  List<StockData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// open : 155.08
/// high : 155.45
/// low : 149.14
/// close : 150.65
/// volume : 80379345.0
/// adj_high : 155.45
/// adj_low : 149.13
/// adj_close : 150.65
/// adj_open : 155.08
/// adj_volume : 80379345.0
/// split_factor : 1.0
/// dividend : 0.0
/// symbol : "AAPL"
/// exchange : "XNAS"
/// date : "2022-11-01T00:00:00+0000"

StockData dataFromJson(String str) => StockData.fromJson(json.decode(str));

String dataToJson(StockData data) => json.encode(data.toJson());

class StockData {
  StockData({
    double? open,
    double? high,
    double? low,
    double? close,
    double? volume,
    double? adjHigh,
    double? adjLow,
    double? adjClose,
    double? adjOpen,
    double? adjVolume,
    double? splitFactor,
    double? dividend,
    String? symbol,
    String? exchange,
    String? date,
  }) {
    _open = open;
    _high = high;
    _low = low;
    _close = close;
    _volume = volume;
    _adjHigh = adjHigh;
    _adjLow = adjLow;
    _adjClose = adjClose;
    _adjOpen = adjOpen;
    _adjVolume = adjVolume;
    _splitFactor = splitFactor;
    _dividend = dividend;
    _symbol = symbol;
    _exchange = exchange;
    _date = date;
  }

  StockData.fromJson(dynamic json) {
    _open = json['open'];
    _high = json['high'];
    _low = json['low'];
    _close = json['close'];
    _volume = json['volume'];
    _adjHigh = json['adj_high'];
    _adjLow = json['adj_low'];
    _adjClose = json['adj_close'];
    _adjOpen = json['adj_open'];
    _adjVolume = json['adj_volume'];
    _splitFactor = json['split_factor'];
    _dividend = json['dividend'];
    _symbol = json['symbol'];
    _exchange = json['exchange'];
    _date = json['date'];
  }

  double? _open;
  double? _high;
  double? _low;
  double? _close;
  double? _volume;
  double? _adjHigh;
  double? _adjLow;
  double? _adjClose;
  double? _adjOpen;
  double? _adjVolume;
  double? _splitFactor;
  double? _dividend;
  String? _symbol;
  String? _exchange;
  String? _date;

  double? get open => _open;

  double? get high => _high;

  double? get low => _low;

  double? get close => _close;

  double? get volume => _volume;

  double? get adjHigh => _adjHigh;

  double? get adjLow => _adjLow;

  double? get adjClose => _adjClose;

  double? get adjOpen => _adjOpen;

  double? get adjVolume => _adjVolume;

  double? get splitFactor => _splitFactor;

  double? get dividend => _dividend;

  String? get symbol => _symbol;

  String? get exchange => _exchange;

  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['open'] = _open;
    map['high'] = _high;
    map['low'] = _low;
    map['close'] = _close;
    map['volume'] = _volume;
    map['adj_high'] = _adjHigh;
    map['adj_low'] = _adjLow;
    map['adj_close'] = _adjClose;
    map['adj_open'] = _adjOpen;
    map['adj_volume'] = _adjVolume;
    map['split_factor'] = _splitFactor;
    map['dividend'] = _dividend;
    map['symbol'] = _symbol;
    map['exchange'] = _exchange;
    map['date'] = _date;
    return map;
  }
}

/// limit : 10
/// offset : 0
/// count : 10
/// total : 252

Pagination paginationFromJson(String str) =>
    Pagination.fromJson(json.decode(str));

String paginationToJson(Pagination data) => json.encode(data.toJson());

class Pagination {
  Pagination({
    int? limit,
    int? offset,
    int? count,
    int? total,
  }) {
    _limit = limit;
    _offset = offset;
    _count = count;
    _total = total;
  }

  Pagination.fromJson(dynamic json) {
    _limit = json['limit'];
    _offset = json['offset'];
    _count = json['count'];
    _total = json['total'];
  }

  int? _limit;
  int? _offset;
  int? _count;
  int? _total;

  int? get limit => _limit;

  int? get offset => _offset;

  int? get count => _count;

  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['limit'] = _limit;
    map['offset'] = _offset;
    map['count'] = _count;
    map['total'] = _total;
    return map;
  }
}
