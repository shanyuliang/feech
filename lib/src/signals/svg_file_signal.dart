import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../extensions/file_extension/file_extension.dart';
import '../support/app_cache_manager.dart';

class SvgFileSignal extends StreamSignal<(String, File?)> {
  final bool debugLogDiagnostics;

  SvgFileSignal({
    required final AppCacheManager appCacheManager,
    required final String svgLink,
    final Map<String, String>? headers,
    this.debugLogDiagnostics = false,
  }) : super(() async* {
         yield* appCacheManager.getFileStream(svgLink, headers: headers).asyncMap((fileResponse) async {
           final file = (fileResponse as FileInfo).file;
           if (await file.isSvgFile()) {
             return (svgLink, file);
           } else {
             Future(() {
               appCacheManager.removeFile(svgLink);
             });
             return (svgLink, null);
           }
         });
       });
}
