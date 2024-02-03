import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../Exceptions/api_exception.dart';

class ApiService {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  final kBackendURL = "http://10.0.2.2:4000";

  ApiService()
      : _dio = Dio(),
        _secureStorage = const FlutterSecureStorage();

  Future postFormData(
    String path,
    Map<String, dynamic> data,
  ) async {
    final formData = FormData();
    for (final entry in data.entries) {
      formData.fields.add(MapEntry(entry.key, entry.value.toString()));
    }
    try {
      final options = await _getRequestOptions();
      final response = await _dio.post(
        '$kBackendURL$path',
        data: formData,
        options: options,
      );
      final parsedResponse = _parseResponse(response);

      return parsedResponse;
    } on DioException catch (e) {
      return _handleException(e);
    }
  }

  Map<String, dynamic> _parseResponse(Response response) {
    final parsedBody = response.data;

    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return parsedBody;
    } else {
      final errorMessage = parsedBody['message'] ?? 'An error occurred';
      print(errorMessage);
      throw ApiException(response.statusCode!, errorMessage);
    }
  }

  Future<Options> _getRequestOptions() async {
    final options = Options(contentType: 'application/json');

    // final token = await _secureStorage.read(key: 'authToken');
    // if (token != null) {
    //   options.headers!['Authorization'] = 'Bearer $token';
    // }

    return options;
  }

  void _handleException(DioException e) {
    print((e.response?.data));

    if (e.response?.statusCode == 500) {
      throw ApiException(
        500,
        e.response?.data['errorMessage'],
        stackTrace: e.stackTrace,
      );
    } else {
      throw ApiException(400, 'An error occurred');
    }
  }
}

class FormDataFile {
  final String fieldName;
  final String filePath;

  FormDataFile({required this.fieldName, required this.filePath});
}
