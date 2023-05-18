part of 'config.dart';

/// 옵션 파일 로드
enum _ConfigFilePathOption {
  DEVELOPMENT_FILE,
  PRODUCTION_FILE,
  COMMON_FILE,
}

/// 옵션 파일 경로 관리자
class _ConfigFilePath {
  static const String _root = 'asset/config';
  static String development = path.join(_root, 'config.development.json');
  static String production = path.join(_root, 'config.production.json');
  static String common = path.join(_root, 'config.common.json');

  static String getFilePath(CB_CONFIG_ENVIRONMENT env) {
    if (env == CB_CONFIG_ENVIRONMENT.DEVELOPMENT) {
      return development;
    } else if (env == CB_CONFIG_ENVIRONMENT.PRODUCTION) {
      return production;
    } else {
      return common;
    }
  }

  static String getFilePathFromOption(_ConfigFilePathOption option) {
    switch (option) {
      case _ConfigFilePathOption.DEVELOPMENT_FILE:
        return development;
      case _ConfigFilePathOption.PRODUCTION_FILE:
        return production;
      case _ConfigFilePathOption.COMMON_FILE:
        return common;
      default:
        throw Exception("옵션이 잘못됐습니다");
    }
  }
}

class _ConfigFileLoader {
  late String _path;
  _ConfigFileLoader(CB_CONFIG_ENVIRONMENT env) {
    _path = _ConfigFilePath.getFilePath(env);
  }
  _ConfigFileLoader.fromOption(_ConfigFilePathOption option)
      : _path = _ConfigFilePath.getFilePathFromOption(option);

  Future<Map<String, dynamic>> load() async {
    try {
      var _raw = await rootBundle.loadString(_path);
      return jsonDecode(_raw);
    } catch (e) {
      print('[CONFIG FILE LOADER] JSON 로드 중, 오류가 발생했습니다 ${e.toString()}');
      throw e;
    }
  }
}
