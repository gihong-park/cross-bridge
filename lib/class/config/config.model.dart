part of 'config.dart';

/// 앱 설정 관리 클래스
class CBConfig {
  /// 싱글톤 클래스 생성
  static late CBConfig _instance = CBConfig._();

  factory CBConfig() {
    return _instance;
  }

  CBConfig._();

  late CB_CONFIG_ENVIRONMENT currentEnvironment = _CURRENT_APP_DEVELOPMENT;

  /// 환경 종속 설정 로드 여부
  late bool _envIsReady = false;

  /// 환경 종속 설정
  late _EnvDependentConfig _envConfig;

  /// 공통 설정 로드 여부
  late bool _commonIsReady = false;

  /// 공통 설정
  late _CommonConfig _commonConfig;

  /// 모든 데이터의 로드 여부
  bool get isReady => _envIsReady && _commonIsReady;

  /// 환경 종속 설정
  Future<_EnvDependentConfig> get env async {
    if (!_instance._envIsReady) {
      var _raw = await _ConfigFileLoader(currentEnvironment).load();
      _instance._envConfig = _EnvDependentConfig.fromJson(_raw);
      _instance._envIsReady = true;
    }
    return _instance._envConfig;
  }

  /// 공통 설정
  Future<_CommonConfig> get common async {
    if (!_instance._commonIsReady) {
      var _raw = await _ConfigFileLoader.fromOption(
        _ConfigFilePathOption.COMMON_FILE,
      ).load();
      _instance._commonConfig = _CommonConfig.fromJson(_raw);
      _instance._commonIsReady = true;
    }
    return _instance._commonConfig;
  }
}
