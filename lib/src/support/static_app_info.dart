import 'dart:developer' as developer;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

import '../constants.dart';
import '../utilities/handy_util.dart';

class StaticAppInfo {
  static late final String name;
  static late final String package;
  static late final String versionString;
  static late final String versionWithBuildNumberString;
  static late final Version version;
  static late final String deviceModel;
  static late final Version deviceOsVersion;

  static Future<void> init({DeviceInfoPlugin? useDeviceInfoPlugin, bool debugLogDiagnostics = false}) async {
    final packageInfo = await PackageInfo.fromPlatform();
    name = packageInfo.appName;
    package = packageInfo.packageName;
    versionString = packageInfo.version;
    versionWithBuildNumberString = "${packageInfo.version} (${packageInfo.buildNumber})";
    version = Version.parse(versionString);
    final deviceInfoPlugin = useDeviceInfoPlugin ?? DeviceInfoPlugin();
    if (kIsWeb) {
      final webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
      deviceModel = webBrowserInfo.appName ?? webBrowserInfo.browserName.name;
      deviceOsVersion = suppressThrowableSyncDefault(
        throwable: () {
          return Version.parse(webBrowserInfo.appVersion ?? "0");
        },
        whenError: (error, stackTrace) {
          return Version(0, 0, 0);
        },
      );
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.fuchsia:
          deviceModel = "Unknown Fuchsia Device";
          deviceOsVersion = Version(0, 0, 0);
          break;
        case TargetPlatform.linux:
          final linuxInfo = await deviceInfoPlugin.linuxInfo;
          deviceModel = linuxInfo.prettyName;
          deviceOsVersion = suppressThrowableSyncDefault(
            throwable: () {
              return Version.parse(linuxInfo.version ?? "0");
            },
            whenError: (error, stackTrace) {
              return Version(0, 0, 0);
            },
          );
          break;
        case TargetPlatform.macOS:
          final macOsInfo = await deviceInfoPlugin.macOsInfo;
          deviceModel = macOsInfo.model;
          deviceOsVersion = suppressThrowableSyncDefault(
            throwable: () {
              return Version.parse(macOsInfo.osRelease);
            },
            whenError: (error, stackTrace) {
              return Version(0, 0, 0);
            },
          );
          break;
        case TargetPlatform.windows:
          final windowsInfo = await deviceInfoPlugin.windowsInfo;
          deviceModel = windowsInfo.productName;
          deviceOsVersion = Version(windowsInfo.majorVersion, windowsInfo.minorVersion, 0, build: windowsInfo.buildNumber.toString());
          break;
        case TargetPlatform.android:
          final androidInfo = await deviceInfoPlugin.androidInfo;
          deviceModel = androidInfo.model;
          deviceOsVersion = suppressThrowableSyncDefault(
            throwable: () {
              return Version.parse(androidInfo.version.release);
            },
            whenError: (error, stackTrace) {
              return Version(0, 0, 0);
            },
          );
          break;
        case TargetPlatform.iOS:
          final iosInfo = await deviceInfoPlugin.iosInfo;
          deviceModel = iosInfo.utsname.machine;
          deviceOsVersion = suppressThrowableSyncDefault(
            throwable: () {
              return Version.parse(iosInfo.systemVersion);
            },
            whenError: (error, stackTrace) {
              return Version(0, 0, 0);
            },
          );
          break;
      }
    }

    if (debugLogDiagnostics) {
      developer.log(staticToString(), name: debugTag);
    }
  }

  static String staticToString() {
    return 'StaticAppInfo{name: $name, package: $package, versionString: $versionString, versionWithBuildNumberString: $versionWithBuildNumberString, version: $version, deviceModel: $deviceModel, deviceOsVersion: $deviceOsVersion}';
  }
}
