import 'package:mpos_beat/core/param/param_builder.dart';

class DeleteUserParam extends ToMap {
  final String userId;

  DeleteUserParam({required this.userId});

  @override
  Map<String, dynamic> toMap() {
    return {
      "UserID": userId,
    };
  }
}
