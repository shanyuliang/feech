import 'dart:developer' as developer;

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants.dart';
import '../../extensions/string_extension.dart';

part 'asset_manifest_provider.g.dart';

@Riverpod(keepAlive: true)
class AssetManifestProvider extends _$AssetManifestProvider {
  @override
  Future<AssetManifest> build({bool debugLogDiagnostics = false}) async {
    return AssetManifest.loadFromAssetBundle(rootBundle);
  }

  String getActionAssetName(String baseAssetName) {
    final assetList = state.requireValue.listAssets();
    final assetCandidateNames = baseAssetName.asAssetGetCandidates();
    if (debugLogDiagnostics) {
      developer.log("AppAssetManifestProvider assetCandidateNames $assetCandidateNames", name: debugTag);
    }
    return assetCandidateNames.firstWhereOrNull((element) => assetList.contains(element)) ?? baseAssetName;
  }
}
