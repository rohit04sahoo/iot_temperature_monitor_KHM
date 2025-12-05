import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginEvent>(_login);
    on<SignupEvent>(_signup);
    on<LogoutEvent>(_logout);
  }

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await repository.signIn(event.email, event.password);
      emit(AuthSuccess(user!.uid));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _signup(SignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await repository.signUp(event.email, event.password);
      emit(AuthSuccess(user!.uid));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _logout(LogoutEvent event, Emitter<AuthState> emit) async {
    await repository.signOut();
    emit(AuthInitial());
  }
}
