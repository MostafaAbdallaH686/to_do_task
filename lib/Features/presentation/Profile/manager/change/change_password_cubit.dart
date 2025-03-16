import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Features/presentation/Profile/manager/change/change_password_state.dart';
import 'package:to_do_app/Features/presentation/Profile/repo/profile_repo.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInit());
  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  ProfileRepo repo = ProfileRepo();

  TextEditingController currentpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController newpasswordconfirm = TextEditingController();

  void onChangePassword() async {
    emit(ChangePasswordLoading());
    var response = await repo.changepassword(
      currentpassword: currentpassword.text,
      newpassword: newpassword.text,
      newpasswordconfirm: newpasswordconfirm.text,
    );
    response.fold(
      (error) {
        emit(ChangePasswordError(error));
      },
      (r) {
        emit(ChangePasswordSuccess(r!));
      },
    );
  }
}
