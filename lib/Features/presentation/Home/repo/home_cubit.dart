import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_app/Features/presentation/Home/repo/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeIntialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  bool mySwitch = true;
  bool myCheckBox = true;
  // ignore: non_constant_identifier_names
  void ChangeCheckBox(bool? value) {
    myCheckBox = value ?? myCheckBox;
    emit(HomeCheckBoxState());
  }

  // ignore: non_constant_identifier_names
  void ChangeSwitch(bool value) {
    mySwitch = value;
    emit(HomeSwitchState());
  }
}
