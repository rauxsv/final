abstract class AuthenticationEvent {}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationLoginRequested extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationLoginRequested({required this.email, required this.password});
}

class AuthenticationSignUpRequested extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationSignUpRequested({required this.email, required this.password});
}

class AuthenticationLoggedOut extends AuthenticationEvent {}

class AuthenticationFailed extends AuthenticationEvent {
  final String message;

  AuthenticationFailed({required this.message});
}