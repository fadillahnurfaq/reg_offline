import 'package:flutter/material.dart';

class MainRouteObserver extends NavigatorObserver {
  final List<Route<dynamic>?> _history = <Route<dynamic>?>[];

  List<Route<dynamic>> get history => List<Route<dynamic>>.from(_history);

  void Function()? onRefreshUploadedMember;
  void Function()? onRefreshDraftMember;
  

  @override
  void didPop(Route route, Route? previousRoute) {
    if (_history.isNotEmpty) {
      _history.removeLast();
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _history.add(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _history.remove(route);
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    final index = _history.indexOf(oldRoute);
    if (index != -1 && newRoute != null) {
      _history[index] = newRoute;
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  int pageCount(String pageName) {
    int pageCount = 0;
    for (var history in history) {
      String? name = history.settings.name;
      if (name ==  "/$pageName") {
        pageCount++;
      }
    }
    return pageCount;
  }
}
