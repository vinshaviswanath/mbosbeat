// import 'dart:io';
// import 'package:dio/dio.dart';

// import 'package:injectable/injectable.dart';
// import 'package:mpos_beat/core/exception/custom_exception.dart';
// import 'package:mpos_beat/core/utils/imports.dart';
// import 'package:mpos_beat/core/utils/urls.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';

// @lazySingleton
// class DioClient {
//   final Dio dio;
//   String? token;
//   late String fcmToken;

//   DioClient(this.dio) {
//     dio
//       ..options.baseUrl = Urls.baseURL
//       ..options.connectTimeout = const Duration(milliseconds: 60000)
//       ..options.receiveTimeout = const Duration(milliseconds: 60000);
//     dio.interceptors.add(
//       PrettyDioLogger(
//         requestBody: true,
//       ),
//     );
//     dio.interceptors.add(InternetConnectionInterceptor());
//     dio.interceptors.add(LoggingInterceptor());
//     dio.interceptors.add(
//       QueuedInterceptorsWrapper(
//         onError: (DioException error, ErrorInterceptorHandler handler) async {
//           if (error.response?.statusCode == 401) {
//             // TODO Navigate
//           } else {
//             return handler.next(error);
//           }
//         },
//       ),
//     );
//   }

//   Future<Response> get(
//     String uri, {
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       var response = await dio.get(
//         uri,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } on SocketException catch (e) {
//       throw CustomException(
//         errMsg: e.toString(),
//       );
//     } on FormatException catch (_) {
//       throw CustomException(errMsg: "Unable to process the data");
//     } on DioException catch (e) {
//       // log error from API response
//       Logger.logError(e.response?.data['d']?['Message'] ?? e.message);

//       if (e.message == "No internet connection") {
//         throw CustomException(errMsg: e.message ?? '');
//       }
//       if (e.type == DioExceptionType.cancel) {
//         throw CustomException(errMsg: 'Cancelled By User');
//       }

//       throw CustomException(
//         errMsg: (e.response?.data['d']?['Message'] ?? 'Unknown API error')
//             .capitalize,
//       );
//     } catch (_) {
//       throw CustomException(errMsg: "Unknown error occurred");
//     }
//   }

//   Future<Response> post(
//     String uri, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       var response = await dio.post(
//         uri,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } on SocketException catch (e) {
//       // print("no network - 1");
//       throw CustomException(
//         errMsg: e.toString(),
//       );
//     } on FormatException catch (_) {
//       throw CustomException(errMsg: "Unable to process the data");
//     } on DioException catch (e) {
//       Logger.logError(e.response!.data['d']['Message']);
//       if (e.message == "No internet connection") {
//         throw CustomException(errMsg: e.message ?? '');
//       }
//       if (e.type == DioExceptionType.cancel) {
//         throw CustomException(errMsg: 'Canceld By User');
//       }

//       throw CustomException(
//           errMsg: (e.response!.data['d']['Message'].capitalize));
//     } catch (_) {
//       throw CustomException(errMsg: "Unknown error occurred");
//     }
//   }

//   Future<Response> put(
//     String uri, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       var response = await dio.put(
//         uri,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } on FormatException catch (_) {
//       throw CustomException(errMsg: "Unable to process the data");
//     } catch (e) {
//       if (e is DioException && e.message == "No internet connection") {
//         throw CustomException(errMsg: e.message ?? '');
//       }
//       if (e is DioException) {
//         final message = e.response?.data['message'];

//         throw CustomException(errMsg: '$message'.capitalize);
//       }
//       rethrow;
//     }
//   }

//   Future<Response> delete(
//     String uri, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//   }) async {
//     try {
//       var response = await dio.delete(
//         uri,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//       );
//       return response;
//     } on FormatException catch (_) {
//       throw CustomException(errMsg: "Unable to process the data");
//     } catch (e) {
//       if (e is DioException && e.message == "No internet connection") {
//         throw CustomException(errMsg: e.message ?? '');
//       }
//       if (e is DioException) {
//         final message = e.response?.data['message'];

//         throw CustomException(errMsg: '$message'.capitalize);
//       }
//       throw CustomException(
//         errMsg: e.toString(),
//       );
//     }
//   }
// }

// class LoggingInterceptor extends InterceptorsWrapper {
//   @override
//   Future onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     DateTime now = DateTime.now().toUtc();
//     // String? token = box.read(AppConstants.token);
//     options.headers.addAll({
//       'Timestamp': now.millisecondsSinceEpoch,
//       'Content-Type': 'application/json; charset=UTF-8',
//       // 'Authorization': 'Bearer ${sl<SharedPreferences>().getString('token') ?? ''}',
//       'Authorization': 'Bearer ' '}',
//       'Access-Control-Allow-Origin': '*',
//       'Accept': 'application/json',
//       'Device-Type': Platform.isAndroid
//           ? 1
//           : Platform.isIOS
//               ? 2
//               : 0,
//       // 'Device-Token': AppConstants.fcmToken ?? "",
//       // 'Language': di.sl<LanguageBloc>().locale.languageCode,
//       // 'User-Agent': AppConstants.userAgent ?? {}
//     });

//     Logger.logWarning("Headers: ${options.headers.toString()}");
//     Logger.logWarning("Parms: ${options.data.toString()}");
//     return super.onRequest(options, handler);
//   }

//   @override
//   Future onResponse(
//       Response response, ResponseInterceptorHandler handler) async {
//     try {
//       return response.isOk
//           ? super.onResponse(response, handler)
//           : handler.reject(
//               DioException(
//                 requestOptions: response.requestOptions,
//                 error: response.data,
//                 response: response,
//                 type: DioExceptionType.unknown,
//               ),
//             );
//     } catch (e) {
//       handler.reject(
//         DioException(
//           requestOptions: response.requestOptions,
//           error: "Something went wrong",
//           response: response,
//           type: DioExceptionType.unknown,
//         ),
//       );
//     }
//   }

//   @override
//   Future onError(DioException err, ErrorInterceptorHandler handler) async {
//     return super.onError(err, handler);
//   }
// }

// class InternetConnectionInterceptor extends Interceptor {
//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult.contains(ConnectivityResult.none)) {
//       return handler.reject(
//         DioException(
//           requestOptions: options,
//           message: 'No internet connection',
//           type: DioExceptionType.connectionTimeout,
//         ),
//       );
//     }
//     return super.onRequest(options, handler);
//   }
// }

// extension DioExceptionExtension on DioException {
//   String get errorMessage => _getErrorMsg(this);

//   String _getErrorMsg(DioException e) {
//     Logger.logError(e);
//     switch (e.type) {
//       case DioExceptionType.cancel:
//         return "Request to server was cancelled";
//       case DioExceptionType.connectionError:
//         return "Connection timeout with server";

//       case DioExceptionType.receiveTimeout:
//         return "Receive timeout in connection with server";
//       case DioExceptionType.badResponse:
//         if (e.response?.statusCode == 500) {
//           return "Internal server error";
//         }

//         if (e.response?.statusCode == 422) {
//           return e.response?.data?['message'] ??
//               e.response?.data?['error']['message'] ??
//               'Somthing went wrong';
//         }

//         if (e.response?.statusCode == 403) {
//           return e.response?.data?['error']['message'] ?? 'Somthing went wrong';
//         }

//         if (e.response?.statusCode == 401) {
//           return e.response?.data?['message'] ?? 'Somthing went wrong';
//         }
//         Logger.logSuccess(e.response?.data);

//         return "Somthing went wrong";
//       case DioExceptionType.sendTimeout:
//         return "Send timeout with server";
//       case DioExceptionType.unknown:
//       default:
//         return "Unexpected error occurred";
//     }
//   }
// }

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/urls.dart';

@lazySingleton
class HttpClient {
  final http.Client client;
  String? token;

  HttpClient(this.client);

  static final String baseUrl = Urls.baseURL;

  Future<http.Response> get(
    String uri, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final url =
          Uri.parse(baseUrl + uri).replace(queryParameters: queryParameters);
      final response = await client.get(url, headers: _getHeaders(headers));

      return _handleResponse(response);
    } on SocketException catch (e) {
      throw CustomException(errMsg: e.toString());
    } catch (e) {
      throw CustomException(errMsg: "Unknown error occurred");
    }
  }

  Future<http.Response> post(
    String uri, {
    dynamic data,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final url = Uri.parse(baseUrl + uri);

      Logger.logInfo(data.toString());

      final response = await client.post(
        url,
        headers: _getHeaders(headers),
        body: jsonEncode(data),
      );

      return _handleResponse(response);
    } on SocketException catch (e) {
      throw CustomException(errMsg: e.toString());
    } catch (e, s) {
      Logger.logInfo(e.toString());
      throw CustomException(
        errMsg: "Unknown error occurred",
        stackTrace: s,
      );
    }
  }

  Future<http.Response> put(
    String uri, {
    dynamic data,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final url =
          Uri.parse(baseUrl + uri).replace(queryParameters: queryParameters);
      final response = await client.put(
        url,
        headers: _getHeaders(headers),
        body: jsonEncode(data),
      );

      return _handleResponse(response);
    } on SocketException catch (e) {
      throw CustomException(errMsg: e.toString());
    } catch (e) {
      throw CustomException(errMsg: "Unknown error occurred");
    }
  }

  Future<http.Response> delete(
    String uri, {
    dynamic data,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final url =
          Uri.parse(baseUrl + uri).replace(queryParameters: queryParameters);
      final response = await client.delete(
        url,
        headers: _getHeaders(headers),
      );

      return _handleResponse(response);
    } on SocketException catch (e) {
      throw CustomException(errMsg: e.toString());
    } catch (e) {
      throw CustomException(errMsg: "Unknown error occurred");
    }
  }

  http.Response _handleResponse(http.Response response) {
    Logger.logWarning(jsonDecode(response.body));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      throw CustomException(
        errMsg: 'API Error: ${response.statusCode} - ${response.body}',
      );
    }
  }

  Map<String, String> _getHeaders(Map<String, String>? additionalHeaders) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token ?? ''}',
      'Accept': 'application/json',
      'Device-Type': Platform.isAndroid
          ? '1'
          : Platform.isIOS
              ? '2'
              : '0',
      'Access-Control-Allow-Origin': '*',
      if (additionalHeaders != null) ...additionalHeaders,
    };
  }

  Future<bool> isInternetAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
