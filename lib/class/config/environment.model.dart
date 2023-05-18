part of 'config.dart';

class _EnvDependentConfig {
  /// 백엔드 서버 hostname
  late final String hostname;

  /// 백엔드 서버 port
  late final String? port;

  /// 백엔드 서버 API 주소 패스
  late final String apiPath;

  _EnvDependentConfig(this.hostname, this.port, this.apiPath);

  // ignore: unused_element
  _EnvDependentConfig.fromJson(Map<String, dynamic> json)
      : hostname = json['hostname'],
        port = json['port'],
        apiPath = json['apiPath'];
}
