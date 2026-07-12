part of 'login_cuibt_cubit.dart';

@immutable
sealed class LoginCuibtState {}

final class LoginCuibtInitial extends LoginCuibtState {}
class LogInLoading extends LoginCuibtState{}
class LogInSuccess extends LoginCuibtState{}
class LogInfailue extends LoginCuibtState{
  final String message;
  LogInfailue(this.message);
}