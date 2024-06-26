// NOTE: Run `melos gen:build_runner` after editing this file

import 'package:json_annotation/json_annotation.dart';

part 'pubspec.g.dart';

@JsonSerializable()
class Pubspec {
  const Pubspec({
    required this.packageName,
    required this.flutterGen,
    required this.flutter,
  });

  factory Pubspec.fromJson(Map json) => _$PubspecFromJson(json);

  @JsonKey(name: 'name', required: true)
  final String packageName;

  @JsonKey(name: 'flutter_gen', required: true)
  final FlutterGen flutterGen;

  @JsonKey(name: 'flutter', required: true)
  final Flutter flutter;
}

@JsonSerializable()
class Flutter {
  const Flutter({
    required this.assets,
    required this.fonts,
  });

  factory Flutter.fromJson(Map json) => _$FlutterFromJson(json);

  @JsonKey(name: 'assets', required: true)
  final List<Object> assets;

  @JsonKey(name: 'fonts', required: true)
  final List<FlutterFonts> fonts;
}

@JsonSerializable()
class FlutterFonts {
  const FlutterFonts({required this.family});

  factory FlutterFonts.fromJson(Map json) => _$FlutterFontsFromJson(json);

  @JsonKey(name: 'family', required: true)
  final String family;
}

@JsonSerializable()
class FlutterGen {
  const FlutterGen({
    required this.output,
    required this.lineLength,
    required this.parseMetadata,
    required this.assets,
    required this.fonts,
    required this.integrations,
    required this.colors,
  });

  factory FlutterGen.fromJson(Map json) => _$FlutterGenFromJson(json);

  @JsonKey(name: 'output', required: true)
  final String output;

  @JsonKey(name: 'line_length', required: true)
  final int lineLength;

  @JsonKey(name: 'parse_metadata', required: true)
  final bool parseMetadata;

  @JsonKey(name: 'assets', required: true)
  final FlutterGenAssets assets;

  @JsonKey(name: 'fonts', required: true)
  final FlutterGenFonts fonts;

  @JsonKey(name: 'integrations', required: true)
  final FlutterGenIntegrations integrations;

  @JsonKey(name: 'colors', required: true)
  final FlutterGenColors colors;
}

@JsonSerializable()
class FlutterGenColors {
  const FlutterGenColors({
    required this.enabled,
    required this.inputs,
    required this.outputs,
  });

  factory FlutterGenColors.fromJson(Map json) =>
      _$FlutterGenColorsFromJson(json);

  @JsonKey(name: 'enabled', required: true)
  final bool enabled;

  @JsonKey(name: 'inputs', required: true)
  final List<String> inputs;

  @JsonKey(name: 'outputs', required: true)
  final FlutterGenElementOutputs outputs;
}

@JsonSerializable()
class FlutterGenAssets {
  const FlutterGenAssets({
    required this.enabled,
    this.packageParameterEnabled,
    this.style,
    required this.outputs,
    required this.exclude,
  });

  factory FlutterGenAssets.fromJson(Map json) =>
      _$FlutterGenAssetsFromJson(json);

  @JsonKey(name: 'enabled', required: true)
  final bool enabled;

  @Deprecated('Moved to under outputs')
  @JsonKey(name: 'package_parameter_enabled', required: false)
  final bool? packageParameterEnabled;

  @Deprecated('Moved to under outputs')
  @JsonKey(name: 'style', required: false)
  final String? style;

  @JsonKey(name: 'outputs', required: true)
  final FlutterGenElementAssetsOutputs outputs;

  @JsonKey(name: 'exclude', required: true)
  final List<String> exclude;
}

@JsonSerializable()
class FlutterGenFonts {
  const FlutterGenFonts({
    required this.enabled,
    required this.outputs,
  });

  factory FlutterGenFonts.fromJson(Map json) => _$FlutterGenFontsFromJson(json);

  @JsonKey(name: 'enabled', required: true)
  final bool enabled;

  @JsonKey(name: 'outputs', required: true)
  final FlutterGenElementOutputs outputs;
}

@JsonSerializable()
class FlutterGenIntegrations {
  const FlutterGenIntegrations({
    required this.flutterSvg,
    required this.flareFlutter,
    required this.rive,
    required this.lottie,
  });

  factory FlutterGenIntegrations.fromJson(Map json) =>
      _$FlutterGenIntegrationsFromJson(json);

  @JsonKey(name: 'flutter_svg', required: true)
  final bool flutterSvg;

  @JsonKey(name: 'flare_flutter', required: true)
  final bool flareFlutter;

  @JsonKey(name: 'rive', required: true)
  final bool rive;

  @JsonKey(name: 'lottie', required: true)
  final bool lottie;
}

@JsonSerializable()
class FlutterGenElementOutputs {
  const FlutterGenElementOutputs({
    required this.className,
  });

  factory FlutterGenElementOutputs.fromJson(Map json) =>
      _$FlutterGenElementOutputsFromJson(json);

  @JsonKey(name: 'class_name', required: true)
  final String className;
}

@JsonSerializable()
class FlutterGenElementAssetsOutputs extends FlutterGenElementOutputs {
  const FlutterGenElementAssetsOutputs({
    required String className,
    required this.packageParameterEnabled,
    required this.directoryPathEnabled,
    required this.style,
  })  : assert(
          style == dotDelimiterStyle ||
              style == snakeCaseStyle ||
              style == camelCaseStyle,
        ),
        super(className: className);

  factory FlutterGenElementAssetsOutputs.fromJson(Map json) =>
      _$FlutterGenElementAssetsOutputsFromJson(json);

  static const String dotDelimiterStyle = 'dot-delimiter';
  static const String snakeCaseStyle = 'snake-case';
  static const String camelCaseStyle = 'camel-case';

  @JsonKey(name: 'package_parameter_enabled', defaultValue: false)
  final bool packageParameterEnabled;

  @JsonKey(name: 'directory_path_enabled', defaultValue: false)
  final bool directoryPathEnabled;

  @JsonKey(name: 'style', required: true)
  final String style;

  bool get isDotDelimiterStyle => style == dotDelimiterStyle;

  bool get isSnakeCaseStyle => style == snakeCaseStyle;

  bool get isCamelCaseStyle => style == camelCaseStyle;
}
