import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants.dart';
import '../extensions/file_extension/file_extension.dart';

part 'svg_file_provider.g.dart';

@Riverpod()
class SvgFileProvider extends _$SvgFileProvider {
  @override
  Stream<(String, File?)> build({required final String svgLink, final Map<String, String>? headers}) async* {
    yield* defaultAppCacheManager.getFileStream(svgLink, headers: headers).asyncMap(
      (fileResponse) async {
        final file = (fileResponse as FileInfo).file;
        if (await file.isSvgFile()) {
          return (svgLink, file);
        } else {
          Future(() {
            defaultAppCacheManager.removeFile(svgLink);
          });
          return (svgLink, null);
        }
      },
    );
  }
}
