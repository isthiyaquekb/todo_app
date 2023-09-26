import 'dart:developer';
import 'dart:io';
import 'package:get/get_connect/connect.dart';
import 'package:todo_app/datasource/network/api_request_methods.dart';
import 'package:todo_app/datasource/network/app_exceptions.dart';

class NetworkClient{
  static const requestTimeOut = Duration(seconds: 25);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = NetworkClient();
  static NetworkClient get instance => _singleton;

  Future request(APIRequestMethod request) async {
    log("REQ URL==>${request.url}");
    try {
      final response = await _client.request(
        request.url,
        request.method.string,
        headers: request.headers,
        query: request.query,
        body: request.body,
      );
      return _returnResponse(response);
    } on ApiNotRespondingException catch (_) {
      throw ApiNotRespondingException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(response.body.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}