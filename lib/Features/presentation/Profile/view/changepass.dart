import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Core/resources_manager/app_colors.dart';
import 'package:to_do_app/Core/resources_manager/app_images.dart';
import 'package:to_do_app/Core/resources_manager/app_setings.dart';
import 'package:to_do_app/Core/resources_manager/mytextbutton.dart';
import 'package:to_do_app/Core/resources_manager/mytextformfield.dart';
import 'package:to_do_app/Features/presentation/Home/view/home_screen_test.dart';
import 'package:to_do_app/Features/presentation/Home/view/new_home_page.dart';
import 'package:to_do_app/Features/presentation/Profile/manager/change/change_password_cubit.dart';
import 'package:to_do_app/Features/presentation/Profile/manager/change/change_password_state.dart';

import 'package:to_do_app/Features/presentation/Profile/view/loginpage.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key, formkey});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 298,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(MyImages.palastine),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  MyTextFormField(
                    top: 23,
                    controller:
                        ChangePasswordCubit.get(context).currentpassword,
                    maxlines: 1,
                    hinttext: MyAppStrings.oldpasshint,
                    labeltext: MyAppStrings.oldpass,
                  ),
                  MyTextFormField(
                    controller: ChangePasswordCubit.get(context).newpassword,
                    maxlines: 1,
                    hinttext: MyAppStrings.newpasshint,
                    labeltext: MyAppStrings.newpass,
                  ),
                  MyTextFormField(
                    controller:
                        ChangePasswordCubit.get(context).newpasswordconfirm,
                    maxlines: 1,
                    hinttext: MyAppStrings.confirmpasshint,
                    labeltext: MyAppStrings.confirmpass,
                  ),
                  BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                    listener: (context, state) {
                      if (state is ChangePasswordSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('change pasasword Success')),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreenTest(),
                          ),
                        );
                      } else if (state is ChangePasswordError) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    builder: (context, state) {
                      if (state is ChangePasswordLoading) {
                        return CircularProgressIndicator();
                      }
                      return MyTextButton(
                        onpressed: () {
                          ChangePasswordCubit.get(context).onChangePassword();
                        },

                        offsety: 4,
                        shadowcolor: MyColors.gray,
                        buttontext: MyAppStrings.changepassword,
                        newscreen: NewHomepage(),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
