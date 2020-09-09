import 'package:dio/dio.dart';

class GetDio {
  bool loggedIn;
  GetDio._();

  static Dio getDio() {
    Dio dio = new Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          options.connectTimeout = 90000;
          options.receiveTimeout = 90000;
          options.sendTimeout = 90000;
          options.followRedirects = true;
          options.baseUrl = "https://enigmatic-shore-16916.herokuapp.com/";
          return options;
        },
        onResponse: (Response response) async {
          return response;
        },
        onError: (DioError dioError) async {
          if (dioError.type == DioErrorType.DEFAULT) {
            if (dioError.message.contains('SocketException')) {
              print("no internet");
            }
          }

          return dioError.response; //continue
        },
      ),
    );
    return dio;
  }
}
