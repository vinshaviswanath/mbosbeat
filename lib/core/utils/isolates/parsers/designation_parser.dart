import 'package:mpos_beat/core/utils/isolates/isolate_parser.dart';
import 'package:mpos_beat/data/models/designation_response.dart';

class DesignationParser extends IsolateParser<DesignationResponse> {
  @override
  DesignationResponse parse(dynamic json) {
    return DesignationResponse.fromJson(json);
  }
}