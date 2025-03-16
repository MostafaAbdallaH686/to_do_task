import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Features/presentation/Profile/manager/register_cubit/register_state.dart';
import 'package:to_do_app/Features/presentation/Profile/repo/profile_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInit());
  static RegisterCubit get(context) => BlocProvider.of(context);

  ProfileRepo repo = ProfileRepo();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  void onRegister() async {
    emit(RegisterLoading());
    var response = await repo.register(
      username: username.text,
      password: password.text,
    );
    response.fold(
      (error) {
        emit(RegisterError(error));
      },
      (r) {
        emit(RegisterSuccess(r!));
      },
    );
  }
}
