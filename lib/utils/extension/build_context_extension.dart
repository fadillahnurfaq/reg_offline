import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension HideKeyboardExt on BuildContext {
  void hideKeyboard() {
    if (!kIsWeb) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
    FocusScope.of(this).unfocus();
  }
}

extension ArgumentExt on BuildContext {
  dynamic getArgument(String key) {
    Object? arguments = ModalRoute.of(this)?.settings.arguments;
    Map<String, dynamic>? args = arguments is Map<dynamic, dynamic>
        ? Map<String, dynamic>.from(arguments)
        : null;
    return args == null ? null : args[key];
  }
}

extension BuildContextExt on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;

  double get deviceWidth => MediaQuery.of(this).size.width;
}

extension NavigatorExt on BuildContext {
  void pop<T extends Object>([T? result]) {
    Navigator.pop(this, result);
  }

  void popToRoot<T extends Object>() {
    Navigator.popUntil(this, (route) => route.isFirst);
  }

  Future<T?> push<T extends Object>(Widget widget, [String? name]) async {
    return Navigator.push<T>(
      this,
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: name),
      ),
    );
  }

  Future<T?> pushReplacement<T extends Object, TO extends Object>(
    Widget widget,
  ) async {
    return Navigator.pushReplacement<T, TO>(
      this,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object>(Widget widget) async {
    return Navigator.pushAndRemoveUntil<T>(
      this,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
  }
}