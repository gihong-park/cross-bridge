part of 'config.dart';

class _CommonConfig {
  /// 앱 이름
  late final String appName;

  _CommonConfig(this.appName);

  // ignore: unused_element
  _CommonConfig.fromJson(Map<String, dynamic> json) : appName = json['appName'];
}
