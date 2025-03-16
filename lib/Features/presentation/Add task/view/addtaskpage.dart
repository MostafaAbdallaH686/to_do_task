import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Core/resources_manager/app_colors.dart';
import 'package:to_do_app/Core/resources_manager/app_images.dart';
import 'package:to_do_app/Core/resources_manager/app_setings.dart';
import 'package:to_do_app/Core/resources_manager/mytextbutton.dart';
import 'package:to_do_app/Core/resources_manager/mytextformfield.dart';
import 'package:to_do_app/Features/presentation/Home/view/home_screen_test.dart';
import 'package:to_do_app/Features/presentation/Home/view/homepagebeforaddingtask.dart';
import 'package:to_do_app/Features/presentation/Home/view/new_home_page.dart';
import 'package:to_do_app/Features/tasks/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:to_do_app/Features/tasks/manager/get_tasks_cubit/get_tasks_state.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTasksCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text(MyAppStrings.addtasktitle),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              width: 261,
              height: 207,
              margin: EdgeInsets.only(bottom: 29),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(MyImages.palastine),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            MyTextFormField(
              maxlines: 1,
              hinttext: MyAppStrings.titlehint,
              labeltext: MyAppStrings.title,
            ),
            MyTextFormField(
              maxlines: 1,
              hinttext: MyAppStrings.descriptionhint,
              labeltext: MyAppStrings.description,
            ),
            BlocConsumer<GetTasksCubit, GetTasksState>(
              listener: (context, state) {
                if (state is GetTasksSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.tasks.toString())),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewHomepage()),
                  );
                } else if (state is GetTasksError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                if (state is GetTasksLoading) {
                  return CircularProgressIndicator();
                }
                return MyTextButton(
                  onpressed: GetTasksCubit.get(context).getTasks,
                  offsety: 4,
                  shadowcolor: MyColors.gray,
                  buttontext: MyAppStrings.addtasktitle,
                  newscreen: NewHomepage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
