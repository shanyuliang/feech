import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../extensions/string_extension.dart';

part 'app_asset_manifest_provider.g.dart';

@Riverpod()
class AppAssetManifestProvider extends _$AppAssetManifestProvider {
  @override
  Future<AssetManifest> build() async {
    return await AssetManifest.loadFromAssetBundle(rootBundle);
  }

  String getActionAssetName(String baseAssetName, {String? localeName}) {
    final assetList = state.requireValue.listAssets();
    final baseLocaleName = baseAssetName.asAssetGetPathName(localeName: localeName);
    final variantName = baseAssetName.asAssetGetVariantPathName(localeName: localeName);
    final flavorName = baseAssetName.asAssetGetFlavorPathName(localeName: localeName);
    final buildTypeName = baseAssetName.asAssetGetBuildTypePathName(localeName: localeName);
    if (assetList.contains(variantName)) {
      return variantName;
    } else if (assetList.contains(flavorName)) {
      return flavorName;
    } else if (assetList.contains(buildTypeName)) {
      return buildTypeName;
    } else {
      return baseLocaleName;
    }
  }
}
