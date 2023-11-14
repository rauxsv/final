import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_market/authen_repository.dart';
import 'package:flutter_market/presentation/bloc/authen_event.dart';
import 'package:flutter_market/presentation/bloc/authen_state.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc({required this.authenticationRepository})
      : super(AuthenticationInitial()) {
    on<AuthenticationStarted>((event, emit) async {
  emit(AuthenticationInProgress());
  try {
    final user = await authenticationRepository.getCurrentUser();
    if (user != null && user.email != null) {
      emit(AuthenticationSuccess(email: user.email!));
    } else {
      emit(AuthenticationInitial());
    }
  } catch (error) {
    emit(AuthenticationFailure(message: error.toString()));
  }
});

    on<AuthenticationLoginRequested>((event, emit) async {
      emit(AuthenticationInProgress());
      try {
        await authenticationRepository.signInWithCredentials(event.email, event.password);
        emit(AuthenticationSuccess(email: event.email));
      } catch (error) {
        emit(AuthenticationFailure(message: error.toString()));
      }
    });

    on<AuthenticationSignUpRequested>((event, emit) async {
      emit(AuthenticationInProgress());
      try {
        await authenticationRepository.signUp(event.email, event.password);
        emit(AuthenticationSuccess(email: event.email));
      } catch (error) {
        emit(AuthenticationFailure(message: error.toString()));
      }
    });

    on<AuthenticationLoggedOut>((event, emit) async {
      await authenticationRepository.signOut();
      emit(AuthenticationInitial());
    });

    on<AuthenticationFailed>((event, emit) {
      emit(AuthenticationFailure(message: event.message));
    });
  }
}