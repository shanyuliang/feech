import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../extensions/file_extension/file_extension.dart';
import '../../support/app_cache_manager.dart';

class CachedNetworkSvgPicture extends ConsumerWidget {
  final String url;
  final Widget? loadingPlaceholder;
  final Widget? errorPlaceholder;
  final ColorFilter? colorFilter;
  final BoxFit fit;

  const CachedNetworkSvgPicture({
    super.key,
    required this.url,
    this.loadingPlaceholder,
    this.errorPlaceholder,
    this.colorFilter,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFile = ref.watch(svgFileProvider(url));
    return asyncFile.when(
      loading: () {
        return loadingPlaceholder ?? const DefaultPlaceholder();
      },
      error: (Object error, StackTrace stackTrace) {
        return errorPlaceholder ?? const DefaultPlaceholder();
      },
      data: (File? file) {
        return FileSvgPicture(
          file: file,
          loadingPlaceholder: loadingPlaceholder,
          errorPlaceholder: errorPlaceholder,
          colorFilter: colorFilter,
          fit: fit,
        );
      },
    );
  }
}

class FileSvgPicture extends StatelessWidget {
  final File? file;
  final Widget? loadingPlaceholder;
  final Widget? errorPlaceholder;
  final ColorFilter? colorFilter;
  final BoxFit fit;

  const FileSvgPicture({
    super.key,
    required this.file,
    this.loadingPlaceholder,
    this.errorPlaceholder,
    this.colorFilter,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    if (file != null) {
      return SvgPicture.file(
        file!,
        placeholderBuilder: (_) {
          return loadingPlaceholder ?? const DefaultPlaceholder();
        },
        colorFilter: colorFilter,
        fit: fit,
      );
    } else {
      return errorPlaceholder ?? const DefaultPlaceholder();
    }
  }
}

class DefaultPlaceholder extends StatelessWidget {
  const DefaultPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(dimension: 1);
  }
}

class SvgFileNotifier extends AutoDisposeFamilyStreamNotifier<File?, String> {
  @override
  Stream<File?> build(String arg) {
    /// We check if the file is a valid SVG file.
    /// If the result is false, we
    /// 1. Remove the file from cache;
    /// 2. Emit null in the file stream;
    return AppCacheManager().getFileStream(arg).asyncMap(
      (fileResponse) async {
        final file = (fileResponse as FileInfo).file;
        if (await file.isSvgFile()) {
          return file;
        } else {
          Future(() {
            AppCacheManager().removeFile(arg);
          });
          return null;
        }
      },
    );
  }
}

final svgFileProvider = AutoDisposeStreamNotifierProviderFamily<SvgFileNotifier, File?, String>(SvgFileNotifier.new);
