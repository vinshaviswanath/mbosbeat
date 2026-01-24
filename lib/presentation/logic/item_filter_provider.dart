import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/daos/item_master_dao/item_master_dao.dart';

class ItemFilterProvider extends ChangeNotifier {
  final ItemMasterDao dao;

  ItemFilterProvider(this.dao) {
    _itemsStream = dao.watchAllActiveItems();
  }

  late final Stream<List<ItemMasterData>> _itemsStream;

  String _search = '';
  String _selectedGroup = 'All';
  String _selectedCategory = 'All';

  String get selectedGroup => _selectedGroup;
  String get selectedCategory => _selectedCategory;

  /// 🔹 Group dropdown stream
  Stream<List<String>> get groupStream async* {
    await for (final items in _itemsStream) {
      final groups = items
          .map((e) => e.groupName)
          .whereType<String>()
          .toSet()
          .toList()
        ..sort();

      yield ['All', ...groups];
    }
  }

  /// 🔹 Category dropdown stream
  Stream<List<String>> get categoryStream async* {
    await for (final items in _itemsStream) {
      final categories = items
          .map((e) => e.categoryName)
          .whereType<String>()
          .toSet()
          .toList()
        ..sort();

      yield ['All', ...categories];
    }
  }

  /// 🔹 Main filtered items stream
  Stream<List<ItemMasterData>> get filteredItems async* {
    await for (final items in _itemsStream) {
      var list = items;

      if (_selectedGroup != 'All') {
        list = list
            .where((e) => e.groupName == _selectedGroup)
            .toList();
      }

      if (_selectedCategory != 'All') {
        list = list
            .where((e) => e.categoryName == _selectedCategory)
            .toList();
      }

      if (_search.isNotEmpty) {
        final q = _search.toLowerCase();
        list = list.where((e) {
          return e.itemName.toLowerCase().contains(q) ||
              e.stockItemId.toString().contains(q) ||
              e.aliasName.toLowerCase().contains(q) ||
              e.partNumber.toLowerCase().contains(q);
        }).toList();
      }

      yield list;
    }
  }

  /// 🔹 Actions
  void selectGroup(String value) {
    _selectedGroup = value;
    notifyListeners();
  }

  void selectCategory(String value) {
    _selectedCategory = value;
    notifyListeners();
  }

  void updateSearch(String value) {
    _search = value;
    notifyListeners();
  }
}
