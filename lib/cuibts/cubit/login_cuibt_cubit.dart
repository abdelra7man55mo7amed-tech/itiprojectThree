import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/cachHelper.dart';
import 'package:itiprojectthree/core/models/user_model.dart';
import 'package:meta/meta.dart';

part 'login_cuibt_state.dart';

class LoginCuibtCubit extends Cubit<LoginCuibtState> {
  LoginCuibtCubit() : super(LoginCuibtInitial());
  final dio = Dio();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> login() async {
    try {
      emit(LogInLoading());
      final Response response = await dio.post(
        "https://api.escuelajs.co/api/v1/auth/login",
        data: {"email": email.text, "password": password.text},
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(response.data);
        await CacheHelper.saveToken(userModel.accessToken!);
        emit(LogInSuccess());
      } else {
        emit(LogInfailue('no token'));
      }
    } on DioException catch (e) {
      emit(LogInfailue(e.message ?? "Error"));
    }
  }
}
