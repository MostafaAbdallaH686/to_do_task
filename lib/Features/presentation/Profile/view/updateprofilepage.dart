import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Core/resources_manager/app_colors.dart';
import 'package:to_do_app/Core/resources_manager/app_images.dart';
import 'package:to_do_app/Core/resources_manager/app_setings.dart';

import 'package:to_do_app/Core/resources_manager/mytextformfield.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              controller: name,
              maxlines: 1,
              hinttext: MyAppStrings.namehint,
              labeltext: MyAppStrings.name,
            ),
            SizedBox(height: 63),
            Container(
              width: 331,
              height: 48.01,
              margin: EdgeInsets.only(left: 22, right: 20, top: 30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: MyColors.gray2.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(14),
                color: MyColors.green,
              ),
              child: TextButton(
                onPressed: () {
                  // ProfileCubit.get(
                  //   context,
                  // ).update(UserModel(name: name.text));
                },
                child: Text(
                  MyAppStrings.save,
                  style: TextStyle(
                    color: MyColors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  return MyTextButton(
//                       offsety: 4,
//                       shadowcolor: MyColors.gray2,
//                       buttontext: "Save",
//                       newscreen: HomeBeforTasks(),
//                     );