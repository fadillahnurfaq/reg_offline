sealed class ValidatorResult{
  bool get isInitial => this is InitialValidationResult;
  bool get isSuccess => this is SuccessValidationResult;
  bool get isFailed => this is FailedValidationResult;

  String? get errorMessage => isFailed ? (this as FailedValidationResult).message : null;
}

class InitialValidationResult extends ValidatorResult {}

class SuccessValidationResult extends ValidatorResult {}

class FailedValidationResult extends ValidatorResult {
  String message;

  FailedValidationResult(this.message);
}
