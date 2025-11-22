import 'package:mpos_beat/core/utils/isolates/parser_registry.dart';
import 'package:mpos_beat/core/utils/isolates/parsers/designation_parser.dart';
import 'package:mpos_beat/core/utils/isolates/parsers/user_list_parser.dart';
import 'package:mpos_beat/data/models/designation_response.dart';
import 'package:mpos_beat/data/models/users_list_model.dart';

void initParsers() {
  ParserRegistry.register<DesignationResponse>(DesignationParser());
  ParserRegistry.register<UsersListModel>(UserListParser());
}
