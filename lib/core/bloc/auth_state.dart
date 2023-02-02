part of 'auth_bloc.dart';

enum AuthStateStatus { initial, loading, success, failure }

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStateStatus.initial,
    this.errorMessage = '',
  });

  final AuthStateStatus status;
  final String errorMessage;

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];

  AuthState copyWith({
    AuthStateStatus? status,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// @immutable
// abstract class AuthState extends Equatable {}

// // When the user presses the signin or signup button the state is changed to loading first and then to Authenticated.
// class Loading extends AuthState {
//   @override
//   List<Object?> get props => [];
// }

// // When the user is authenticated the state is changed to Authenticated.
// class Authenticated extends AuthState {
//   @override
//   List<Object?> get props => [];
// }

// // This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
// class UnAuthenticated extends AuthState {
//   @override
//   List<Object?> get props => [];
// }

// // If any error occurs the state is changed to AuthError.
// class AuthError extends AuthState {
//   final String error;

//   AuthError(this.error);
//   @override
//   List<Object?> get props => [error];
// }


