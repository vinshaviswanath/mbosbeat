import 'dart:isolate';
import 'isolate_parser.dart';

class IsolateService {
  static Future<T> runParser<T>(
    IsolateParser<T> parser,
    dynamic json,
  ) async {
    return await Isolate.run(() {
      return parser.parse(json);
    });
  }
}
