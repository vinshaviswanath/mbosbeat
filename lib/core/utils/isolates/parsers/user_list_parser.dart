import 'package:mpos_beat/core/utils/isolates/isolate_parser.dart';
import 'package:mpos_beat/data/models/users_list_model.dart';

class UserListParser extends IsolateParser<UsersListModel> {
  @override
  UsersListModel parse(dynamic json) {
    return UsersListModel.fromJson(json);
  }
}