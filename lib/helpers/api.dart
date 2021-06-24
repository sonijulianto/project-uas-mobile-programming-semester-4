import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:submission_flutter_pemua/helpers/user_info.dart';
import 'app_exception.dart';

class Api {
  Future<dynamic> post(String url, dynamic data) async {
    var urll = Uri.tryParse(url);
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http.post(urll,
          body: data,
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> get(url) async {
    var urll = Uri.parse(url);
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http.get(urll,
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(url) async {
    var urll = Uri.parse(url);
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http.delete(urll,
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 422:
        throw InvalidInputException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
