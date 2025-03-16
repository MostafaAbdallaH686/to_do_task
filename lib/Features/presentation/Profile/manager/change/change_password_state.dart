import 'package:to_do_app/Features/presentation/Profile/model/user_model.dart';

abstract class ChangePasswordState {}

class ChangePasswordInit extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordError extends ChangePasswordState {
  String error;
  ChangePasswordError(this.error);
}

class ChangePasswordSuccess extends ChangePasswordState {
  String msg;
  ChangePasswordSuccess(this.msg);
}
