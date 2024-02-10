import 'package:dio/dio.dart';
import 'package:ecom/constants.dart';

import '../Exceptions/api_exception.dart';

var kdioBaseOptions = BaseOptions(
  baseUrl: kBackendURL,
  contentType: Headers.jsonContentType,
);

class ApiService {
  final Dio _dio = Dio(kdioBaseOptions);

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
        path,
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
      throw ApiException(response.statusCode!, errorMessage);
    }
  }

  Future<Options> _getRequestOptions() async {
    final options = Options(contentType: 'application/json');

    return options;
  }

  void _handleException(DioException e) {
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
