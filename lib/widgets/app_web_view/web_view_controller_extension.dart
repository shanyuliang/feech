import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';

import 'web_storage_item.dart';
import 'web_storage_type.dart';

extension WebViewControllerExtension on WebViewController {
  Future<List<WebStorageItem>> getAllWebStorageItems({required WebStorageType webStorageType}) async {
    final resultString = ((await runJavaScriptReturningResult("""
      function getAllWebStorageItems() {
          return Object.keys(window.${webStorageType.name}).map(key => {
              return {
                  key: key,
                  value: window.${webStorageType.name}.getItem(key)
              };
          });
      }
      getAllWebStorageItems();
    """)) as String?) ?? "[]";

    final List<dynamic> resultList = jsonDecode(resultString);
    return resultList.map((item) => WebStorageItem.fromJson(item)).toList();
  }

  Future<WebStorageItem?> getSingleWebStorageItem({required WebStorageType webStorageType, required String key}) async {
    final resultString = (await runJavaScriptReturningResult("""
      function getSingleWebStorageItem() {
          if (Object.keys(window.${webStorageType.name}).includes("$key")) {
              return {
                  key: "$key",
                  value: window.${webStorageType.name}.getItem("$key")
              };
          } else {
              return null;
          }
      }
      getSingleWebStorageItem();
    """)) as String?;

    if (resultString != null && resultString != "null") {
      return WebStorageItem.fromJson(jsonDecode(resultString));
    } else {
      return null;
    }
  }

  Future<void> removeSingleWebStorageItem({required WebStorageType webStorageType, required String key}) async {
    await runJavaScriptReturningResult("""
      function removeWebStorageItem() {
          window.${webStorageType.name}.removeItem("$key");
      }
      removeWebStorageItem();
    """);
  }

  Future<void> removeMatchedWebStorageItem({
    required WebStorageType webStorageType,
    required bool Function(String key) matcher,
  }) async {
    final allItems = await getAllWebStorageItems(webStorageType: webStorageType);
    for (final item in allItems) {
      if (matcher(item.key)) {
        await removeSingleWebStorageItem(webStorageType: webStorageType, key: item.key);
      }
    }
  }

  Future<void> setWebStorageItem({
    required WebStorageType webStorageType,
    required String key,
    required dynamic value,
  }) async {
    final encodedValue = json.encode(value);
    await runJavaScriptReturningResult("""
      function setWebStorageItem() {
          window.${webStorageType.name}.setItem("$key", ${value is String ? encodedValue : "JSON.stringify($encodedValue)"});
      }
      setWebStorageItem();
    """);
  }
}
