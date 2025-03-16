import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Features/presentation/Profile/manager/login_cubit/login_state.dart';
import 'package:to_do_app/Features/presentation/Profile/repo/profile_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  static LoginCubit get(context) => BlocProvider.of(context);

  LoginCubit._internal() : super(LoginInit());
  static LoginCubit _instance = LoginCubit._internal();
  factory LoginCubit() => _instance;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  ProfileRepo repo = ProfileRepo();
  void onloginPressed() async {
    if (validate()) {
      emit(LoginLoading());
      var response = await repo.login(
        username: username.text,
        password: password.text,
      );
      response.fold(
        (error) => emit(LoginError(error)),
        (r) => emit(LoginSuccess(r)),
      );
    }
  }

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }
}
