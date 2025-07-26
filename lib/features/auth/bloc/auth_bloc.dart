import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper_app/features/auth/bloc/auth_event.dart';
import 'package:shopper_app/features/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(AuthLoading());

      try {
        await Future.delayed(const Duration(seconds: 2));

        if (event.email == 'test@test.com' && event.password == 'password') {
          emit(AuthSuccess());
        } else {
          emit(AuthFailure('Invalid email or password.'));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
