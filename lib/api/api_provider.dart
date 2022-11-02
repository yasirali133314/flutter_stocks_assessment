import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'exception/api_exception.dart';

class ApiProvider {
  Future<dynamic> makeGetRequest(String url) async {
    try {
      if (kDebugMode) {
        print('Fetching from URL : $url');
      }
      final response = await http.get(
        Uri.parse(url),
      );
      var parsedResponse = await _response(response);
      if (kDebugMode) {
        print(parsedResponse);
      }
      return parsedResponse;
    } on SocketException {
      return ApiException(message: 'No internet');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return ApiException(message: e.toString());
    }
  }

  dynamic _response(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        if (kDebugMode) {
          print(responseJson);
        }
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        if (kDebugMode) {
          print(responseJson);
        }
        return responseJson;
      case 400:
        return ApiException(statusCode: 400, message: 'Bad Request');
      case 401:
        return ApiException(statusCode: 401, message: 'Unauthorized');
      case 429:
        var body = json.decode(utf8.decode(response.bodyBytes));
        if (body.containsKey('error')) {
          return ApiException(
              statusCode: 429, message: body['error']['message']);
        }
    }
  }
}
