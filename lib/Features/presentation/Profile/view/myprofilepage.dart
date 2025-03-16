import 'package:flutter/material.dart';
import 'package:to_do_app/Core/resources_manager/app_icons.dart';
import 'package:to_do_app/Core/resources_manager/customappbar.dart';
import 'package:to_do_app/Core/resources_manager/profilecontainer.dart';
import 'package:to_do_app/Features/presentation/Profile/view/changepass.dart';
import 'package:to_do_app/Features/presentation/Profile/view/updateprofilepage.dart';
import 'package:to_do_app/Features/presentation/Settings/view/settingspage.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: Column(
        children: [
          ProfileContainer(
            icon1p: Myicons.profile,
            textp: '   Update Profile',
            nextscreen: UpdateProfilePage(),
          ),
          ProfileContainer(
            icon1p: Myicons.lock,
            textp: "    Chagce Password",
            nextscreen: ChangePasswordPage(),
          ),
          ProfileContainer(
            icon1p: Myicons.setting,
            textp: "    Settings",
            nextscreen: Settingspage(),
          ),
        ],
      ),
    );
  }
}
