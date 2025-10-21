// Http Client

// Http Client

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class HttpClient {
  final http.Client client;

  HttpClient(this.client);

  static final String baseUrl = Urls.baseURL;

  Future<http.Response> get(
    String uri, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final url = Uri.parse(
        baseUrl + uri,
      ).replace(queryParameters: queryParameters);
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
      throw CustomException(errMsg: "Unknown error occurred", stackTrace: s);
    }
  }

  Future<http.Response> postFormData(
    String uri, {
    required Map<String, dynamic> fields,
    Map<String, File>? files,
    Map<String, String>? headers,
  }) async {
    try {
      final url = Uri.parse(baseUrl + uri);
      final request = http.MultipartRequest('POST', url);

      // Remove content-type since Multipart handles it
      final headerMap = _getHeaders(headers)..remove('Content-Type');
      request.headers.addAll(headerMap);

      // Add fields
      fields.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // Add files
      if (files != null && files.isNotEmpty) {
        for (var entry in files.entries) {
          final file = entry.value;
          final stream = http.ByteStream(file.openRead());
          final length = await file.length();
          request.files.add(
            http.MultipartFile(
              entry.key,
              stream,
              length,
              filename: file.path.split('/').last,
            ),
          );
        }
      }

      Logger.logInfo("FormData fields: $fields");
      Logger.logInfo("FormData files: ${files?.keys.toList()}");

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } on SocketException catch (e) {
      throw CustomException(errMsg: e.toString());
    } catch (e, s) {
      Logger.logInfo("FormData error: $e");
      throw CustomException(
        errMsg: "Unknown error occurred during file upload",
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
      final url = Uri.parse(
        baseUrl + uri,
      ).replace(queryParameters: queryParameters);
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
      final url = Uri.parse(
        baseUrl + uri,
      ).replace(queryParameters: queryParameters);
      final response = await client.delete(url, headers: _getHeaders(headers));

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
    final pref = sl<SharedPreferences>();
    final token = pref.getString('token') ?? '';
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
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
