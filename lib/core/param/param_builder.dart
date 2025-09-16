import 'dart:io';
import 'dart:typed_data';

import 'package:mpos_beat/core/utils/enums.dart';
import 'package:dio/dio.dart';

class ParamBuilder {
  final Map<String, dynamic> _params = {};

  // Private constructor
  ParamBuilder._();

  // Factory constructor to initialize the builder
  factory ParamBuilder() => ParamBuilder._();

  // Method to add simple key-value pairs
  ParamBuilder addParam({
    required String key,
    required dynamic value,
  }) {
    _params[key] = value;
    return this;
  }

  // Method to add file or byte data
  Future<ParamBuilder> addFormData<T>({
    required T param,
    required String key,
  }) async {
    MultipartFile? data;
    if (param is File) {
      data = await MultipartFile.fromFile(
        param.path,
      );
    } else if (param is Uint8List) {
      data = MultipartFile.fromBytes(param);
    } else {
      throw ArgumentError('Unsupported type: ${param.runtimeType}');
    }

    _params[key] = data;
    return this;
  }

  FormData addMultipleFile(List<String> paths) {
    final formData = FormData.fromMap(build());

    for (var path in paths) {
      formData.files.add(
        MapEntry(
          'uploadDocument',
          MultipartFile.fromFileSync(
            path,
            filename: path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }
    return formData;
  }

  // Method to build and get the final parameters
  Map<String, dynamic> build() => _params;
}

// Base param ========================================================================

// class BaseParams<T extends ToMap> {
//   final APIAction action;
//   final ActionType type;
//   final int? id;
//   final T data;
//   final OptionalParamData? optionalDara;

//   BaseParams({
//     this.action = APIAction.none,
//     required this.type,
//     required this.data,
//     this.id,
//     this.optionalDara,
//   });

//   Map<String, dynamic> toMap() {
//     final baseParam = <String, dynamic>{
//       'type': type.name,
//       'attributes': data.toMap(),
//     };
//     if (id != null) {
//       baseParam['id'] = id;
//     }
//     return <String, dynamic>{
//       'data': baseParam,
//     };
//   }
// }

// abstract class ToMap {
//   Map<String, dynamic> toMap();
// }

class BaseParams<T extends ToMap> {
  final T data;
  BaseParams({required this.data});

  Map<String, dynamic> toMap() {
    return data.toMap();
  }
}

abstract class ToMap {
  Map<String, dynamic> toMap();
}

class PaginatedBaseParam<T extends ToMap> {
  final APIAction action;
  final ActionType type;
  final T data;
  PaginatedBaseParam({
    this.action = APIAction.none,
    required this.type,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': {
        'type': type.name,
        'attributes': data.toMap(),
      }
    };
  }
}

class OptionalParamData<T> {
  T data;
  OptionalParamData(this.data);
}
