import 'dart:developer' as developer;

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../constants.dart';
import '../extensions/string_extension.dart';

class AssetManifestSignal extends FutureSignal<AssetManifest> {
  final bool debugLogDiagnostics;

  AssetManifestSignal({this.debugLogDiagnostics = false})
    : super(() {
        return AssetManifest.loadFromAssetBundle(rootBundle);
      }, debugLabel: "AssetManifestSignal");

  String getActionAssetName(String baseAssetName) {
    final assetList = peek().value?.listAssets() ?? [];
    final assetCandidateNames = baseAssetName.asAssetGetCandidates();
    if (debugLogDiagnostics) {
      developer.log("AssetManifestSignal assetCandidateNames $assetCandidateNames", name: debugTag);
    }
    return assetCandidateNames.firstWhereOrNull((element) => assetList.contains(element)) ?? baseAssetName;
  }
}
