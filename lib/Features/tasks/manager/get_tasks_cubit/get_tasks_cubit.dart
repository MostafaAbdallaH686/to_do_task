import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Features/tasks/data/repo/get_tasks_repo.dart';
import 'package:to_do_app/Features/tasks/manager/get_tasks_cubit/get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInit());

  static GetTasksCubit get(context) => BlocProvider.of(context);

  GetTasksRepo getTasksRepo = GetTasksRepo();
  void getTasks() async {
    emit(GetTasksLoading());
    var response = await getTasksRepo.getTasks();
    response.fold(
      (e) => emit(GetTasksError(e)),
      (tasks) => emit(GetTasksSuccess(tasks)),
    );
  }
}
