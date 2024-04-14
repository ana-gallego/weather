import 'package:http/http.dart';
import 'package:weather/core/network/api_response.dart';

extension ResponseExtension on Response {
  ApiResponse<T> toApiResponse<T>() {
    final body = this.body;

    if (body.isEmpty) {
      return ApiResponse<T>(
        success: false,
        message: 'There was an error while processing the request',
      );
    }

    return ApiResponse<T>(
      success: true,
      message: 'The request was received successfully',
      data: body as T,
    );
  }
}
