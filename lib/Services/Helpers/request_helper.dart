import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  ApiService()
      : _dio = Dio(),
        _secureStorage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> postFormData(
    String path,
    Map<String, dynamic> data,
    List<FormDataFile> files,
  ) async {
    final formData = FormData();
    for (final entry in data.entries) {
      formData.fields.add(MapEntry(entry.key, entry.value.toString()));
    }
    for (final file in files) {
      formData.files.add(MapEntry(
        file.fieldName,
        await MultipartFile.fromFile(file.filePath),
      ));
    }

    final options = await _getRequestOptions();
    final response = await _dio.post(
      '${DotEnv().env['BACKEND_URL']}/$path',
      data: formData,
      options: options,
    );

    final parsedResponse = _parseResponse(response);

    return parsedResponse;
  }

  Map<String, dynamic> _parseResponse(Response response) {
    final parsedBody = response.data;

    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return parsedBody;
    } else {
      final errorMessage = parsedBody['message'] ?? 'An error occurred';
      throw ApiException(response.statusCode!, errorMessage);
    }
  }

  Future<Options> _getRequestOptions() async {
    final options = Options(contentType: 'application/json');

    final token = await _secureStorage.read(key: 'authToken');
    if (token != null) {
      options.headers!['Authorization'] = 'Bearer $token';
    }

    return options;
  }
}

class FormDataFile {
  final String fieldName;
  final String filePath;

  FormDataFile({required this.fieldName, required this.filePath});
}

class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);
}
