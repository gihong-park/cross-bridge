library or_config;

import 'dart:convert';
import 'dart:core';

import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;

import 'config.enum.dart';

part 'config.model.dart';
part 'environment.model.dart';
part 'common.model.dart';
part 'config.loader.dart';

/// GLOBAL Configuration Environment Initialized
/// https://github.com/flutter/flutter/issues/4014#issuecomment-429910252
const CB_CONFIG_ENVIRONMENT _CURRENT_APP_DEVELOPMENT =
    bool.fromEnvironment('dart.vm.product', defaultValue: false)
        ? CB_CONFIG_ENVIRONMENT.PRODUCTION
        : CB_CONFIG_ENVIRONMENT.DEVELOPMENT;
