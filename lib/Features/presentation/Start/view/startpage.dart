import 'package:flutter/material.dart';
import 'package:to_do_app/Core/resources_manager/app_colors.dart';
import 'package:to_do_app/Core/resources_manager/app_images.dart';
import 'package:to_do_app/Core/resources_manager/app_setings.dart';
import 'package:to_do_app/Core/resources_manager/mytextbutton.dart';
import 'package:to_do_app/Features/presentation/Profile/view/registerpage.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 36,
                top: 34,
                bottom: 60.14,
                right: 20,
              ),
              width: 301.7,
              height: 342.86,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(MyImages.start),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Text(
                "Welcome To",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: MyColors.black,
                ),
              ),
            ),
            Center(
              child: Text(
                "Do It !",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: MyColors.black,
                ),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Text(
                "Ready to conquer your tasks? Let's Do ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: MyColors.gray,
                ),
              ),
            ),
            Center(
              child: Text(
                "It together.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: MyColors.gray,
                ),
              ),
            ),

            MyTextButton(
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              offsety: 5,
              shadowcolor: MyColors.green,
              buttontext: MyAppStrings.startb,
              newscreen: RegisterPage(),
            ),
          ],
        ),
      ),
    );
  }
}
