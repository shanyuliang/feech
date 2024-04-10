import 'package:http/http.dart';

extension BaseResponseExtension on BaseResponse {
  String toLoggingString() {
    if (this is Response) {
      final response = this as Response;
      final request = response.request;
      if (request is Request) {
        return "${request.method} ${request.url} ${response.headers} ${response.statusCode} ${response.body}";
      } else {
        return "Unsupported request type ${request.runtimeType} in response";
      }
    } else {
      return "Unsupported response type $runtimeType";
    }
  }
}
