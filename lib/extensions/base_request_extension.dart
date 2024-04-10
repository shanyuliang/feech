import 'package:async/async.dart';
import 'package:http/http.dart';

extension BaseRequestExtension on BaseRequest {
  String toLoggingString() {
    if (this is Request) {
      final request = this as Request;
      return "${request.method} ${request.url} ${request.headers} ${request.body}";
    } else {
      return "Unsupported request type $runtimeType";
    }
  }

  /// If we make a copy of a StreamRequest, we use the passed in originalStreamSplitter if it is not null. We also return it back
  /// so it can be reused in later makeACopy() call.
  ({
    BaseRequest theCopy,
    StreamSplitter<List<int>>? returnedStreamSplitter,
  }) makeACopy({StreamSplitter<List<int>>? originalStreamSplitter}) {
    if (this is Request) {
      final original = this as Request;
      final request = Request(original.method, original.url)
        ..followRedirects = original.followRedirects
        ..headers.addAll(original.headers)
        ..maxRedirects = original.maxRedirects
        ..persistentConnection = original.persistentConnection
        ..body = original.body;
      return (theCopy: request, returnedStreamSplitter: null);
    } else if (this is StreamedRequest) {
      final original = this as StreamedRequest;
      final streamSplitter = originalStreamSplitter ?? StreamSplitter(original.finalize());
      final request = StreamedRequest(original.method, original.url)
        ..contentLength = original.contentLength
        ..followRedirects = original.followRedirects
        ..headers.addAll(original.headers)
        ..maxRedirects = original.maxRedirects
        ..persistentConnection = original.persistentConnection;
      streamSplitter
          .split()
          .listen(request.sink.add, onError: request.sink.addError, onDone: request.sink.close, cancelOnError: true);
      return (theCopy: request, returnedStreamSplitter: streamSplitter);
    } else {
      throw Exception("Unsupported request type $runtimeType");
    }
  }
}
