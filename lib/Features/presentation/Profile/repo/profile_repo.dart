import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/Core/network/api_helper.dart';
import 'package:to_do_app/Core/network/api_response.dart';
import 'package:to_do_app/Core/network/end_points.dart';
import 'package:to_do_app/Features/presentation/Profile/manager/login_cubit/login_cubit.dart';
import 'package:to_do_app/Features/presentation/Profile/model/user_model.dart';

class ProfileRepo {
  ProfileRepo._internal();
  static ProfileRepo _instance = ProfileRepo._internal();
  factory ProfileRepo() => _instance;

  // UserModel? userModel;
  // Either<String, void> profileRepo<String>(UserModel u) {
  //   try {
  //     userModel = u;
  //     return right(null);
  //   } catch (e) {
  //     return left(e.toString() as String);
  //   }
  // }

  APIHelper dio = APIHelper();

  Future<Either<String, String?>> register({
    required String username,
    required String password,
  }) async {
    try {
      ApiResponse response = await dio.postRequest(
        endPoint: EndPoints.register,
        data: {"username": username, "password": password},
        isAuthorized: false,
      );
      if (response.status) {
        return right(response.message);
      } else {
        return left(response.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }

  Future<Either<String, String?>> changepassword({
    required String currentpassword,
    required String newpassword,
    required String newpasswordconfirm,
  }) async {
    try {
      ApiResponse response = await dio.postRequest(
        endPoint: EndPoints.changepassword,
        data: {
          "current_password": currentpassword,
          "new_password": newpassword,
          "new_password_confirm": newpasswordconfirm,
        },
        isAuthorized: true,
      );

      if (response.status && newpassword == newpasswordconfirm) {
        return right(response.message);
      } else {
        return left(response.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }

  UserModel? userModel;

  get context => null;

  Future<Either<String, UserModel>> login({
    required String username,
    required String password,
  }) async {
    try {
      ApiResponse response = await dio.postRequest(
        endPoint: EndPoints.login,
        data: {"username": username, "password": password},
        isAuthorized: false,
      );
      if (response.status) {
        // success
        LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
          response.data,
        );
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', loginResponseModel.accessToken!);
        await prefs.setString(
          'refresh_token',
          loginResponseModel.refreshToken!,
        );
        // save tokens
        //loginResponseModel.accessToken
        userModel = loginResponseModel.user!;
        return Right(userModel!);
      } else {
        // error
        return Left(response.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }
}
