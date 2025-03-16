import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/Core/resources_manager/app_colors.dart';
import 'package:to_do_app/Core/resources_manager/app_icons.dart';
import 'package:to_do_app/Core/resources_manager/app_setings.dart';
import 'package:to_do_app/Core/resources_manager/customappbar.dart';
import 'package:to_do_app/Features/presentation/Add%20task/view/addtaskpage.dart';
import 'package:to_do_app/Features/presentation/Home/view/wiedget/task_container.dart';
import 'package:to_do_app/Features/tasks/data/models/get_task_reposne_model.dart';
import 'package:to_do_app/Features/tasks/data/repo/get_tasks_repo.dart';
import 'package:to_do_app/Features/tasks/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:to_do_app/Features/tasks/manager/get_tasks_cubit/get_tasks_state.dart';

class NewHomepage extends StatelessWidget {
  const NewHomepage({super.key});
  final int itemcount = 4;
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
                  MaterialPageRoute(builder: (context) => AddTaskPage()),
                );
              },
              icon: SvgPicture.asset(Myicons.addtask),
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  Text(
                    MyAppStrings.tasks,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: MyColors.mintgreen,
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text(
                        MyAppStrings.five,
                        style: TextStyle(
                          color: MyColors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              BlocBuilder<GetTasksCubit, GetTasksState>(
                builder: (context, state) {
                  if (state is GetTasksLoading) {
                    return CircularProgressIndicator();
                  } else if (state is GetTasksError) {
                    return Column(
                      children: [
                        Text(state.error),
                        TextButton(
                          onPressed: () {
                            // todo refresh
                          },
                          child: Text('Refresh'),
                        ),
                      ],
                    );
                  } else if (state is GetTasksSuccess) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.tasks.length,
                        itemBuilder:
                            (context, index) =>
                                TaskItemBuilder(task: state.tasks[index]),
                      ),
                    );
                  }

                  return SizedBox();
                },
              ),

              // BlocBuilder<GetTasksCubit, GetTasksState>(
              //   builder: (context, state) {
              //     if (state is GetTasksLoading) {
              //       return CircularProgressIndicator();
              //     } else if (state is GetTasksSuccess) {
              //       return Expanded(
              //         child: ListView.builder(
              //           itemCount: state.tasks.length,
              //           itemBuilder:
              //               (context, index) =>
              //                   TaskItemBuilder(task: state.tasks[index]),
              //         ),
              //       );
              //     }
              //     return SizedBox();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskItemBuilder extends StatelessWidget {
  const TaskItemBuilder({super.key, required this.task});

  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 90,
      padding: EdgeInsets.only(left: 12, top: 7, right: 12),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyColors.containercolor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                task.title ?? '',
                style: TextStyle(
                  color: MyColors.gray,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              Text(
                task.createdAt ?? '',
                style: TextStyle(color: MyColors.gray),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(task.description ?? '', style: TextStyle(color: MyColors.gray)),
        ],
      ),
    );
  }
}
