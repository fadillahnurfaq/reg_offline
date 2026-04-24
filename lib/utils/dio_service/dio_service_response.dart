mixin DioServiceResponse<T> {
  String get dataKey => 'data';
  T? fromResponseMap(Map<String,dynamic> json) {
    return null;
  }

  List<T> fromResponseList(List? json) {
    final rawList = json;
    return rawList?.map<T>((e) {
      final rawToElementMap = toElementMap(e, null);
      if (rawToElementMap != null) {
        return rawToElementMap;
      }
      return fromResponseMap(e) as T;
    }).toList() ?? [];
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