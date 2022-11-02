import 'dart:convert';

/// pagination : {"limit":1,"offset":0,"count":1,"total":252}
/// data : {"name":"Apple Inc","symbol":"AAPL","has_intraday":false,"has_eod":true,"country":null,"eod":[{"open":153.16,"high":154.24,"low":151.92,"close":153.34,"volume":97848900.0,"adj_high":154.24,"adj_low":151.92,"adj_close":153.34,"adj_open":153.155,"adj_volume":97943171.0,"split_factor":1.0,"dividend":0.0,"symbol":"AAPL","exchange":"XNAS","date":"2022-10-31T00:00:00+0000"}]}

StocksResponse stocksResponseFromJson(String str) =>
    StocksResponse.fromJson(json.decode(str));

String stocksResponseToJson(StocksResponse data) => json.encode(data.toJson());

class StocksResponse {
  StocksResponse(
      {Pagination? pagination,
      Data? data,
      this.message = '',
      this.success = false}) {
    _pagination = pagination;
    _data = data;
  }

  StocksResponse.fromJson(dynamic json) {
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Pagination? _pagination;
  Data? _data;
  String message = '';
  bool success = false;

  Pagination? get pagination => _pagination;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// name : "Apple Inc"
/// symbol : "AAPL"
/// has_intraday : false
/// has_eod : true
/// country : null
/// eod : [{"open":153.16,"high":154.24,"low":151.92,"close":153.34,"volume":97848900.0,"adj_high":154.24,"adj_low":151.92,"adj_close":153.34,"adj_open":153.155,"adj_volume":97943171.0,"split_factor":1.0,"dividend":0.0,"symbol":"AAPL","exchange":"XNAS","date":"2022-10-31T00:00:00+0000"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? name,
    String? symbol,
    bool? hasIntraday,
    bool? hasEod,
    dynamic country,
    List<Eod>? eod,
  }) {
    _name = name;
    _symbol = symbol;
    _hasIntraday = hasIntraday;
    _hasEod = hasEod;
    _country = country;
    _eod = eod;
  }

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _symbol = json['symbol'];
    _hasIntraday = json['has_intraday'];
    _hasEod = json['has_eod'];
    _country = json['country'];
    if (json['eod'] != null) {
      _eod = [];
      json['eod'].forEach((v) {
        _eod?.add(Eod.fromJson(v));
      });
    }
  }

  String? _name;
  String? _symbol;
  bool? _hasIntraday;
  bool? _hasEod;
  dynamic _country;
  List<Eod>? _eod;

  String? get name => _name;

  String? get symbol => _symbol;

  bool? get hasIntraday => _hasIntraday;

  bool? get hasEod => _hasEod;

  dynamic get country => _country;

  List<Eod>? get eod => _eod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['symbol'] = _symbol;
    map['has_intraday'] = _hasIntraday;
    map['has_eod'] = _hasEod;
    map['country'] = _country;
    if (_eod != null) {
      map['eod'] = _eod?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// open : 153.16
/// high : 154.24
/// low : 151.92
/// close : 153.34
/// volume : 97848900.0
/// adj_high : 154.24
/// adj_low : 151.92
/// adj_close : 153.34
/// adj_open : 153.155
/// adj_volume : 97943171.0
/// split_factor : 1.0
/// dividend : 0.0
/// symbol : "AAPL"
/// exchange : "XNAS"
/// date : "2022-10-31T00:00:00+0000"

Eod eodFromJson(String str) => Eod.fromJson(json.decode(str));

String eodToJson(Eod data) => json.encode(data.toJson());

class Eod {
  Eod({
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

  Eod.fromJson(dynamic json) {
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

/// limit : 1
/// offset : 0
/// count : 1
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
