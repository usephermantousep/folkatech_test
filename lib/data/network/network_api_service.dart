import 'dart:io';

import 'package:folkatechtest/data/app_exceptions.dart';
import 'package:folkatechtest/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

//NETWORK SERVICE API
class NetworkApiService extends BaseApiServices {
  //FOR GET REQUEST
  @override
  Future get(String url, {Map<String, String>? headers}) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 10));
      responseJson = returnReponse(response);
    } on SocketException {
      throw NoInternetException('No Internet connection');
    }

    return responseJson;
  }

  dynamic returnReponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw BadRequestException('Bad Request');
      case 401:
        throw UnauthorisedException('Unauthorised Request');
      case 404:
        throw NotFoundException('Data not found');
      case 500:
        throw ServerException('Server Error');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}
