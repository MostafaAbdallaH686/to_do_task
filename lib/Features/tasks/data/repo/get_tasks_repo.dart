import 'package:dartz/dartz.dart';
import 'package:to_do_app/Core/network/api_helper.dart';
import 'package:to_do_app/Core/network/api_response.dart';
import 'package:to_do_app/Core/network/end_points.dart';
import 'package:to_do_app/Features/tasks/data/models/get_task_reposne_model.dart';

class GetTasksRepo {
  APIHelper apiHelper = APIHelper();

  Future<Either<String, List<TaskModel>>> getTasks() async {
    try {
      ApiResponse response = await apiHelper.getRequest(
        endPoint: EndPoints.myTasks,
      );

      if (response.status) {
        // success
        GetTasksResponseModel getTasksResponseModel =
            GetTasksResponseModel.fromJson(response.data);

        return Right(getTasksResponseModel.tasks!);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
