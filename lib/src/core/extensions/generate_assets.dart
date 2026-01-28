// ignore_for_file: avoid_print

// Terminal command
// dart generate_assets.dart json_file.json NameClass

// Generate AppColors
// dart /Users/alitokhtarbay/Desktop/projects/qr_pay_app/lib/src/core/extensions/generate_assets.dart /Users/alitokhtarbay/Desktop/projects/qr_pay_app/assets/json/colors.json AppColors

// Generate AppDimensions
// dart /Users/alitokhtarbay/Desktop/projects/qr_pay_app/lib/src/core/extensions/generate_assets.dart /Users/alitokhtarbay/Desktop/projects/qr_pay_app/assets/json/dimensions.json AppDimensions

// Generate AppTypography
// dart /Users/alitokhtarbay/Desktop/projects/qr_pay_app/lib/src/core/extensions/generate_assets.dart /Users/alitokhtarbay/Desktop/projects/qr_pay_app/assets/json/typography.json AppTypography

// Generate AppComponents
// dart /Users/alitokhtarbay/Desktop/projects/qr_pay_app/lib/src/core/extensions/generate_assets.dart /Users/alitokhtarbay/Desktop/projects/qr_pay_app/assets/json/components.json AppComponents

import 'dart:convert';
import 'dart:io';

class JsonToDartGenerator {
  final Map<String, dynamic> jsonData;
  final String className;

  JsonToDartGenerator(this.jsonData, this.className);

  List<String> keysValue = [];

  String generate() {
    final buffer = StringBuffer();
    buffer.writeln(
        'import \'package:flutter/material.dart\';'); // Import dart:ui package

    // Generate class header
    buffer.writeln('class $className {');
    buffer.writeln();

    // Generate static const variables
    _generateVariables(buffer, jsonData, '');

    // Generate class footer
    buffer.writeln('}');
    return buffer.toString();
  }

  void _generateVariables(
      StringBuffer buffer, Map<dynamic, dynamic> data, String prefix) {
    data.forEach((key, value) {
      if (value is Map) {
        _generateVariables(buffer, value, '$prefix$key.');
      } else {
        if (key == 'value') {
          final type = _getType(data['type']);

          String keyValue = _toCamelCase('$prefix$key');

          keysValue.add(keyValue);
          print(keyValue);

          buffer.writeln(
              '  static const $type $keyValue = ${getValue(value, type)};');
        }
      }
    });
  }

  dynamic _getType(dynamic type) {
    if (type == 'color') {
      return 'Color';
    } else if (type == 'dimension') {
      return 'double';
    } else if (type == 'text') {
      return 'String';
    } else if (type == 'boolean') {
      return 'bool';
    } else {
      return 'dynamic';
    }
  }

  dynamic getValue(String value, String type) {
    if (className == 'AppComponents') {
      String str = _toCamelCase(value.replaceAll('{', '').replaceAll('}', ''));
      if (type == 'Color') {
        // if (str.contains('#')) {
        //   return fromHex(value);
        // } else {
        //   return 'AppColors.$str';
        // }
        return keysValue.contains(str) ? str : 'AppColors.$str';
      } else if (type == 'double') {
        if (str.contains('px')) {
          return str.replaceAll('px', '');
        } else {
          return keysValue.contains(str) ? str : 'AppDimensions.$str';
        }
      } else if (type == 'bool') {
        return str;
      } else {
        return keysValue.contains(str) ? str : 'AppTypography.$str';
      }
    } else if (value.toString().contains('#')) {
      return fromHex(value);
    } else if (value.toString().contains('{')) {
      return _toCamelCase(value.replaceAll('{', '')).replaceAll('}', '');
    } else if (value.contains('px')) {
      return value.replaceAll('px', '');
    } else {
      return "\"$value\"";
    }
  }

  static String fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('0xFF');
    buffer.write(hexString.replaceFirst('#', ''));
    return hexString == '#ffffff00'
        ? "Colors.transparent"
        : "Color(${buffer.toString()})";
  }
}

String _toCamelCase(String key) {
  // Remove any dashes and replace dots with camel case
  final transformedKey = key
      .replaceAll('-', '')
      .replaceAll('.', '_')
      .toLowerCase()
      .replaceAll(' ', '_');

  final withoutValueSuffix =
      transformedKey.replaceAll('_value', '').replaceAll(',', '');

  // Split the key by underscores
  final parts = withoutValueSuffix.split('_');

  // Capitalize each part except the first one
  final capitalizedParts =
      parts.map((part) => part == parts.first ? part : part.capitalize());

  // Join the parts back together
  return capitalizedParts.join();
}

extension StringExtension on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}

String fileName(String originalString) {
  String convertedString = originalString.replaceAllMapped(
      RegExp('[A-Z]'), (match) => '_${match.group(0)!.toLowerCase()}');
  if (convertedString.startsWith('_')) {
    convertedString = convertedString.substring(1);
  }
  print(convertedString); // Output: app_colors
  return convertedString;
}

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart json_to_dart.dart <json_file>');
    exit(1);
  }

  print(args);
  args[0].contains('components.json');

  final jsonFile = args[0];
  final jsonString = File(jsonFile).readAsStringSync();
  final jsonData = json.decode(jsonString);

  final generator = JsonToDartGenerator(jsonData, args[1]);
  final dartCode = generator.generate();

  var outputFilePath =
      'lib/src/core/resources/${fileName(args[1])}.dart'; // Change this to your desired output file path
  File(outputFilePath).writeAsStringSync(dartCode);
}
