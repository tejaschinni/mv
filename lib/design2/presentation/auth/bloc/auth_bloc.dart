import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../../domain/entities/user.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckAuthStatus>((event, emit) async {
      emit(AuthLoading());
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));
      emit(Unauthenticated());
    });

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      // Simulate login delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Mock login logic based on email to demonstrate roles
      if (event.email == 'admin@test.com') {
        emit(const Authenticated(User(id: '1', name: 'Admin User', email: 'admin@test.com', role: UserRole.admin)));
      } else if (event.email == 'host@test.com') {
        emit(const Authenticated(User(id: '2', name: 'Host User', email: 'host@test.com', role: UserRole.host)));
      } else if (event.email == 'reception@test.com') {
        emit(const Authenticated(User(id: '3', name: 'Receptionist User', email: 'reception@test.com', role: UserRole.receptionist)));
      } else {
        emit(const AuthError('Invalid credentials. Use admin@, host@, or reception@ test.com'));
      }
    });

    on<LogoutRequested>((event, emit) {
      emit(Unauthenticated());
    });
  }
}
