import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

class StaticAppInfo {
  static late final String name;
  static late final String package;
  static late final String versionString;
  static late final String versionWithBuildNumberString;
  static late final Version version;

  static Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    name = packageInfo.appName;
    package = packageInfo.packageName;
    versionString = packageInfo.version;
    versionWithBuildNumberString = "${packageInfo.version} (${packageInfo.buildNumber})";
    version = Version.parse(versionString);
  }
}
