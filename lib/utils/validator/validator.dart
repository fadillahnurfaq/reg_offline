import 'validator_result.dart';

typedef OnValidate = ValidatorResult Function();

class Validator {
  final OnValidate _onValidate;

  Validator({
    required OnValidate onValidate,
  }) : _onValidate = onValidate;

  ValidatorResult validate() {
    return _onValidate();
  }
}