import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_app/Features/presentation/Home/repo/home_cubit.dart';
import 'package:to_do_app/Features/presentation/Home/repo/home_state.dart';

class HomeScreenTest extends StatelessWidget {
  const HomeScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text("Text Cubit")),
        body: Column(
          children: [
            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                // ignore: avoid_print
                print(state.toString());
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Switch(
                      value: HomeCubit.get(context).mySwitch,
                      onChanged: HomeCubit.get(context).ChangeSwitch,
                    ),
                    Checkbox(
                      value: HomeCubit.get(context).myCheckBox,
                      onChanged: HomeCubit.get(context).ChangeCheckBox,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
