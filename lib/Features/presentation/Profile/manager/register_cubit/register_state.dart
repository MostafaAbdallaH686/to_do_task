abstract class RegisterState {}

class RegisterInit extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  String msg;
  RegisterSuccess(this.msg);
}

class RegisterError extends RegisterState {
  String error;
  RegisterError(this.error);
}
