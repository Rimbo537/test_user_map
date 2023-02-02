import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_map/data/repositories/auth/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState()) {
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }
  // When User Presses the Google Login Button, we will send the GoogleSignInRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
  // on<GoogleSignInRequested>((event, emit) async {
  //   emit(Loading());
  //   try {
  //     await authRepository.signInWithGoogle();
  //     emit(Authenticated());
  //   } catch (e) {
  //     emit(AuthError(e.toString()));
  //     emit(UnAuthenticated());
  //   }
  // });
  // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
  // on<SignOutRequested>((event, emit) async {
  //   emit(Loading());
  //   await authRepository.signOut();
  //   emit(UnAuthenticated());
  // });
  // }

  Future<void> _onGoogleSignInRequested(
    GoogleSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: AuthStateStatus.loading,
        ),
      );
      await _authRepository.signInWithGoogle();
      return emit(
        state.copyWith(
          status: AuthStateStatus.success,
        ),
      );
    } catch (e) {
      return emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: AuthStateStatus.failure,
        ),
      );
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: AuthStateStatus.loading,
        ),
      );

      await _authRepository.signOut();

      return emit(
        state.copyWith(
          status: AuthStateStatus.success,
        ),
      );
    } catch (e) {
      return emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: AuthStateStatus.failure,
        ),
      );
    }
  }
}
