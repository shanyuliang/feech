import 'dart:async';
import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart';

import '../extensions/content_type_extension.dart';

final defaultAppCacheManager = AppCacheManager();

class AppCacheManager extends CacheManager {
  static const key = 'AppCacheManager';
  static const defaultStalePeriod = Duration(days: 7);
  static const defaultAppFileAge = Duration(days: 7);

  AppCacheManager({
    Client? httpClient,
    Duration? stalePeriod,
    Duration? defaultAge,
  }) : super(
          Config(
            key,
            stalePeriod: stalePeriod ?? defaultStalePeriod,
            fileService: _AppHttpFileService(httpClient: httpClient, defaultAge: defaultAge ?? defaultAppFileAge),
          ),
        );
}

class _AppHttpFileService extends FileService {
  static const defaultFileAge = Duration(days: 7);
  final Client _httpClient;
  final Duration _defaultAge;

  _AppHttpFileService({Client? httpClient, Duration? defaultAge})
      : _httpClient = httpClient ?? Client(),
        _defaultAge = defaultAge ?? defaultFileAge;

  @override
  Future<FileServiceResponse> get(String url, {Map<String, String>? headers}) async {
    final req = Request('GET', Uri.parse(url));
    if (headers != null) {
      req.headers.addAll(headers);
    }
    final httpResponse = await _httpClient.send(req);

    return _AppHttpGetResponse(httpResponse, _defaultAge);
  }
}

class _AppHttpGetResponse implements FileServiceResponse {
  _AppHttpGetResponse(this._response, this._defaultAge);

  final StreamedResponse _response;

  final Duration _defaultAge;

  final _receivedTime = DateTime.now();

  @override
  int get statusCode => _response.statusCode;

  String? _header(String name) {
    return _response.headers[name];
  }

  @override
  Stream<List<int>> get content => _response.stream;

  @override
  int? get contentLength => _response.contentLength;

  @override
  DateTime get validTill {
    var ageDuration = _defaultAge;
    final controlHeader = _header(HttpHeaders.cacheControlHeader);
    if (controlHeader != null) {
      final controlSettings = controlHeader.split(',');
      for (final setting in controlSettings) {
        final sanitizedSetting = setting.trim().toLowerCase();
        if (sanitizedSetting == 'no-cache') {
          ageDuration = Duration.zero;
        }
        if (sanitizedSetting.startsWith('max-age=')) {
          final validSeconds = int.tryParse(sanitizedSetting.split('=')[1]) ?? 0;
          if (validSeconds > 0) {
            ageDuration = Duration(seconds: validSeconds);
          }
        }
      }
    }

    return _receivedTime.add(ageDuration);
  }

  @override
  String? get eTag => _header(HttpHeaders.etagHeader);

  @override
  String get fileExtension {
    var fileExtension = '';
    final contentTypeHeader = _header(HttpHeaders.contentTypeHeader);
    if (contentTypeHeader != null) {
      final contentType = ContentType.parse(contentTypeHeader);
      fileExtension = contentType.fileExtension;
    }
    return fileExtension;
  }
}
