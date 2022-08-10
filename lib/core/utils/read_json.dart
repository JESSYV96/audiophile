import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<Map<String, dynamic>> readJson(String assetPath) async {
  final json = await rootBundle.loadString(assetPath);
  return jsonDecode(json);
}