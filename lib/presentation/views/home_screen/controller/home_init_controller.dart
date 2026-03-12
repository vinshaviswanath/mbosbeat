import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';

@lazySingleton
class HomeInitController {
  HomeInitController({required AppDb appDb}) : _appDb = appDb;

  final AppDb _appDb;

  int? _userId;
  int? get userId => _userId;

  Future<void> initialize(BuildContext context, Company company) async {
   
  }
}
