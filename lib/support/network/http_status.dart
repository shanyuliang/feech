import 'package:http/http.dart';

class HttpStatus {
  final int code;
  final String? _message;

  String get message => _message ?? _getMessage();

  const HttpStatus._(this.code, [this._message]);

  factory HttpStatus.fromCode(int code, String message) =>
      HttpStatus._(code, message);

  factory HttpStatus.fromResponse(Response response) =>
      HttpStatus._(response.statusCode, response.reasonPhrase);

  static const HttpStatus ok = HttpStatus._(200);
  static const HttpStatus created = HttpStatus._(201);
  static const HttpStatus nonAuthoritativeInformation = HttpStatus._(203);
  static const HttpStatus noContent = HttpStatus._(204);
  static const HttpStatus notModified = HttpStatus._(304);
  static const HttpStatus badRequest = HttpStatus._(400);
  static const HttpStatus unauthorized = HttpStatus._(401);
  static const HttpStatus forbidden = HttpStatus._(403);
  static const HttpStatus notFound = HttpStatus._(404);
  static const HttpStatus methodNotAllowed = HttpStatus._(405);
  static const HttpStatus conflict = HttpStatus._(409);
  static const HttpStatus gone = HttpStatus._(410);
  static const HttpStatus unsupportedMediaType = HttpStatus._(415);
  static const HttpStatus unprocessableEntity = HttpStatus._(422);
  static const HttpStatus tooManyRequest = HttpStatus._(429);
  static const HttpStatus internalServerError = HttpStatus._(500);

  String _getMessage() {
    switch (this) {
      case ok:
        return "OK";
      case created:
        return "Created";
      case nonAuthoritativeInformation:
        return "Non-Authoritative Information";
      case noContent:
        return "No Content";
      case notModified:
        return "Not Modified";
      case badRequest:
        return "Bad Request";
      case unauthorized:
        return "Unauthorized";
      case forbidden:
        return "Forbidden";
      case notFound:
        return "Not Found";
      case methodNotAllowed:
        return "Method Not Allowed";
      case conflict:
        return "Conflict";
      case gone:
        return "Gone";
      case unsupportedMediaType:
        return "Unsupported Media Type";
      case unprocessableEntity:
        return "Unprocessable Entity";
      case tooManyRequest:
        return "Too Many Request";
      case internalServerError:
        return "Internal Server Error";
      default:
        return "Unknown";
    }
  }

  @override
  String toString() => "Http Status [$code:$message]";
}
