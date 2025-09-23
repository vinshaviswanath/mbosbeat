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
