import 'dart:convert';

/// pagination : {"limit":10,"offset":0,"count":1,"total":1}
/// data : [{"name":"Apple Inc","symbol":"AAPL","has_intraday":false,"has_eod":true,"country":null,"stock_exchange":{"name":"NASDAQ Stock Exchange","acronym":"NASDAQ","mic":"XNAS","country":"USA","country_code":"US","city":"New York","website":"www.nasdaq.com"}}]

StocksCompanyResponse stocksCompanyResponseFromJson(String str) =>
    StocksCompanyResponse.fromJson(json.decode(str));

String stocksCompanyResponseToJson(StocksCompanyResponse data) =>
    json.encode(data.toJson());

class StocksCompanyResponse {
  StocksCompanyResponse(
      {Pagination? pagination,
      List<Data>? data,
      this.success = false,
      this.message = ''}) {
    _pagination = pagination;
    _data = data;
  }

  StocksCompanyResponse.fromJson(dynamic json) {
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  Pagination? _pagination;
  List<Data>? _data;
  bool success = false;
  String message = '';

  Pagination? get pagination => _pagination;

  List<Data>? get data => _data;

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

/// name : "Apple Inc"
/// symbol : "AAPL"
/// has_intraday : false
/// has_eod : true
/// country : null
/// stock_exchange : {"name":"NASDAQ Stock Exchange","acronym":"NASDAQ","mic":"XNAS","country":"USA","country_code":"US","city":"New York","website":"www.nasdaq.com"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? name,
    String? symbol,
    bool? hasIntraday,
    bool? hasEod,
    dynamic country,
    StockExchange? stockExchange,
  }) {
    _name = name;
    _symbol = symbol;
    _hasIntraday = hasIntraday;
    _hasEod = hasEod;
    _country = country;
    _stockExchange = stockExchange;
  }

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _symbol = json['symbol'];
    _hasIntraday = json['has_intraday'];
    _hasEod = json['has_eod'];
    _country = json['country'];
    _stockExchange = json['stock_exchange'] != null
        ? StockExchange.fromJson(json['stock_exchange'])
        : null;
  }

  String? _name;
  String? _symbol;
  bool? _hasIntraday;
  bool? _hasEod;
  dynamic _country;
  StockExchange? _stockExchange;

  String? get name => _name;

  String? get symbol => _symbol;

  bool? get hasIntraday => _hasIntraday;

  bool? get hasEod => _hasEod;

  dynamic get country => _country;

  StockExchange? get stockExchange => _stockExchange;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['symbol'] = _symbol;
    map['has_intraday'] = _hasIntraday;
    map['has_eod'] = _hasEod;
    map['country'] = _country;
    if (_stockExchange != null) {
      map['stock_exchange'] = _stockExchange?.toJson();
    }
    return map;
  }
}

/// name : "NASDAQ Stock Exchange"
/// acronym : "NASDAQ"
/// mic : "XNAS"
/// country : "USA"
/// country_code : "US"
/// city : "New York"
/// website : "www.nasdaq.com"

StockExchange stockExchangeFromJson(String str) =>
    StockExchange.fromJson(json.decode(str));

String stockExchangeToJson(StockExchange data) => json.encode(data.toJson());

class StockExchange {
  StockExchange({
    String? name,
    String? acronym,
    String? mic,
    String? country,
    String? countryCode,
    String? city,
    String? website,
  }) {
    _name = name;
    _acronym = acronym;
    _mic = mic;
    _country = country;
    _countryCode = countryCode;
    _city = city;
    _website = website;
  }

  StockExchange.fromJson(dynamic json) {
    _name = json['name'];
    _acronym = json['acronym'];
    _mic = json['mic'];
    _country = json['country'];
    _countryCode = json['country_code'];
    _city = json['city'];
    _website = json['website'];
  }

  String? _name;
  String? _acronym;
  String? _mic;
  String? _country;
  String? _countryCode;
  String? _city;
  String? _website;

  String? get name => _name;

  String? get acronym => _acronym;

  String? get mic => _mic;

  String? get country => _country;

  String? get countryCode => _countryCode;

  String? get city => _city;

  String? get website => _website;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['acronym'] = _acronym;
    map['mic'] = _mic;
    map['country'] = _country;
    map['country_code'] = _countryCode;
    map['city'] = _city;
    map['website'] = _website;
    return map;
  }
}

/// limit : 10
/// offset : 0
/// count : 1
/// total : 1

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
