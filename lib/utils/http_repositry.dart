import 'package:dio/dio.dart';
import 'package:http_example/utils/singilton.dart';

enum REQUEST_TYPE { get, post, delete }

class HttpRequest {
  Future<dynamic> callRequest({
    required REQUEST_TYPE requestType,
    required String methodName,
    Map<String, dynamic> queryParam = const {},
    Map<String, dynamic>? body,
    String contentType = Headers.jsonContentType,
  }) async {
    Response? response;

    const String baseUrl = "http://api.stag.orderera.com/pos/api/v6/";

    final dioClient = Dio()
      ..options = BaseOptions(
          baseUrl: baseUrl,
          headers: {"apikey": "4dd28d4d22fbebd8082324a0bd1148475f02c8ffb894e002a979c8c7", "device-id": "791994", "device-type": "ios", "Accept-Language": Singleton.singleton.selectedLanguage},
          followRedirects: false,
          validateStatus: (status) {
            return true;
          });

    switch (requestType) {
      case REQUEST_TYPE.get:
        response = await dioClient.get(methodName, queryParameters: queryParam, options: Options(contentType: contentType));
        break;
      case REQUEST_TYPE.post:
        response = await dioClient.post(methodName, data: body, queryParameters: queryParam, options: Options(contentType: contentType));
        break;
      case REQUEST_TYPE.delete:
        response = await dioClient.delete(methodName, data: body, queryParameters: queryParam, options: Options(contentType: contentType));
        break;
    }

    return response.data;
  }
}
