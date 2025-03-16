import 'package:to_do_app/Features/presentation/Profile/model/user_model.dart';

abstract class LoginState {}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  String error;
  LoginError(this.error);
}

class LoginSuccess extends LoginState {
  UserModel user;
  LoginSuccess(this.user);
}
