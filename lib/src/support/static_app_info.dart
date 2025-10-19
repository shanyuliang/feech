import 'dart:developer' as developer;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

import '../constants.dart';
import '../utilities/handy_util.dart';

class StaticAppInfo {
  static bool isInitialized = false;
  static late final String name;
  static late final String package;
  static late final String versionString;
  static late final String versionWithBuildNumberString;
  static late final Version version;
  static late final String deviceModel;
  static late final Version deviceOsVersion;

  static Future<void> init({DeviceInfoPlugin? useDeviceInfoPlugin, bool debugLogDiagnostics = false}) async {
    if (!isInitialized) {
      final packageInfo = await PackageInfo.fromPlatform();
      name = packageInfo.appName;
      package = packageInfo.packageName;
      versionString = packageInfo.version;
      versionWithBuildNumberString = "${packageInfo.version} (${packageInfo.buildNumber})";
      version = Version.parse(versionString);
      final deviceInfoPlugin = useDeviceInfoPlugin ?? DeviceInfoPlugin();
      if (kIsWeb) {
        final webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
        if (debugLogDiagnostics) {
          developer.log("${webBrowserInfo.data}", name: debugTag);
        }
        deviceModel = webBrowserInfo.browserName.name.isNotEmpty
            ? webBrowserInfo.browserName.name[0].toUpperCase() + webBrowserInfo.browserName.name.substring(1)
            : webBrowserInfo.browserName.name;
        deviceOsVersion = suppressThrowableSyncDefault(
          throwable: () {
            return Version.parse(webBrowserInfo.appVersion ?? "0");
          },
          whenError: (error, stackTrace) {
            return Version(0, 0, 0);
          },
        );

        // Example user agent string for reference:
        // final userAgent = "5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36";
        // final chromeVersionMatch = RegExp(r'Chrome/([\d\.]+)').firstMatch(userAgent);
        // final chromeVersion = chromeVersionMatch != null ? chromeVersionMatch.group(1) : null;
      } else {
        switch (defaultTargetPlatform) {
          case TargetPlatform.fuchsia:
            deviceModel = "Unknown Fuchsia Device";
            deviceOsVersion = Version(0, 0, 0);
            break;
          case TargetPlatform.linux:
            final linuxInfo = await deviceInfoPlugin.linuxInfo;
            if (debugLogDiagnostics) {
              developer.log("${linuxInfo.data}", name: debugTag);
            }
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
            if (debugLogDiagnostics) {
              developer.log("${macOsInfo.data}", name: debugTag);
            }
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
            if (debugLogDiagnostics) {
              developer.log("${windowsInfo.data}", name: debugTag);
            }
            deviceModel = windowsInfo.productName;
            deviceOsVersion = Version(windowsInfo.majorVersion, windowsInfo.minorVersion, 0, build: windowsInfo.buildNumber.toString());
            break;
          case TargetPlatform.android:
            final androidInfo = await deviceInfoPlugin.androidInfo;
            if (debugLogDiagnostics) {
              developer.log("${androidInfo.data}", name: debugTag);
            }
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
            if (debugLogDiagnostics) {
              developer.log("${iosInfo.data}", name: debugTag);
            }
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
      isInitialized = true;
    }

    if (debugLogDiagnostics) {
      developer.log(staticToString(), name: debugTag);
    }
  }

  static String staticToString() {
    return 'StaticAppInfo{name: $name, package: $package, versionString: $versionString, versionWithBuildNumberString: $versionWithBuildNumberString, version: $version, deviceModel: $deviceModel, deviceOsVersion: $deviceOsVersion}';
  }
}
