import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class BlockUserParams extends ToMap {
  final String userId;
  final UserAction action;

  BlockUserParams(this.action, {required this.userId});

  @override
  Map<String, dynamic> toMap() {
    return {
      "UserID": userId,
      "Block" : action.value
    };
  }
}