import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/Core/resources_manager/app_icons.dart';
import 'package:to_do_app/Core/resources_manager/app_images.dart';
import 'package:to_do_app/Core/resources_manager/app_setings.dart';
import 'package:to_do_app/Core/resources_manager/customappbar.dart';
import 'package:to_do_app/Features/presentation/Add%20task/view/addtaskpage.dart';
import 'package:to_do_app/Features/tasks/data/models/get_task_reposne_model.dart';
import 'package:to_do_app/Features/tasks/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:to_do_app/Features/tasks/manager/get_tasks_cubit/get_tasks_state.dart';

class HomeBeforTasks extends StatelessWidget {
  const HomeBeforTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTasksCubit()..getTasks(),
      child: Scaffold(
        appBar: CustomAppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTaskPage(),
                  ), // الصفحة الجديدة
                );
              },
              icon: SvgPicture.asset(Myicons.addtask),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Center(child: Text(MyAppStrings.beforetasks)),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 268,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(MyImages.addtask),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),

        // BlocBuilder<GetTasksCubit, GetTasksState>(
        //   builder: (context, state) {
        //     if (state is GetTasksLoading) {
        //       return CircularProgressIndicator();
        //     } else if (state is GetTasksError) {
        //       return Column(
        //         children: [
        //           Text(state.error),
        //           TextButton(
        //             onPressed: () {
        //               // todo refresh
        //             },
        //             child: Text('Refresh'),
        //           ),
        //         ],
        //       );
        //     } else if (state is GetTasksSuccess) {
        //       if (state.tasks.isEmpty) {
        //         return Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,

        //           children: [
        //             SizedBox(height: 50),
        //             Center(child: Text(MyAppStrings.beforetasks)),
        //             Container(
        //               margin: EdgeInsets.only(top: 30),
        //               width: double.infinity,
        //               height: 268,
        //               decoration: BoxDecoration(
        //                 image: DecorationImage(
        //                   image: AssetImage(MyImages.addtask),
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         );
        //       } else {
        // return ListView.builder(
        //   itemCount: state.tasks.length,
        //   itemBuilder:
        //       (context, index) =>
        //           TaskItemBuilder(task: state.tasks[index]),
        // );
        //         }
        //       }
        //       return SizedBox();
        //     },
        //   ),
        // ),
      ),
    );
  }
}

// class TaskItemBuilder extends StatelessWidget {
//   const TaskItemBuilder({super.key, required this.task});

//   final TaskModel task;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Text(task.title ?? ''),
//           Text(task.description ?? ''),
//           Text(task.createdAt ?? ''),
//         ],
//       ),
//     );
//   }
// }
