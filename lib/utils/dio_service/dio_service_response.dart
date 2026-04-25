mixin DioServiceResponse<T> {
  String get dataKey => 'data';
  T? fromResponseMap(Map<String,dynamic> json) {
    return null;
  }

  List<T> fromResponseList(dynamic json) {
    final rawList = json;
    if (rawList is! List) {
      return [];
    }
    return rawList.map<T>((e) {
      final rawToElementMap = toElementMap(e, null);
      if (rawToElementMap != null) {
        return rawToElementMap;
      }
      return fromResponseMap(e) as T;
    }).toList();
  }
  
  T? fromResponseValue(dynamic value) {
    return null;
  }

  T? toElementMap(dynamic val, T Function(dynamic val)? onCallback) {
    if (onCallback == null) {
      return null;
    }
    return onCallback(val);
  }
}