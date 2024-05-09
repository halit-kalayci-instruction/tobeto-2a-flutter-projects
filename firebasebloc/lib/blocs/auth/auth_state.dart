abstract class AuthState {}

class NotAuthenticated extends AuthState {}

class LoginProgress extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginError extends AuthState {
  String? errorMessage;

  LoginError({this.errorMessage});
}
