// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'geolocation_bloc.dart';

enum GeolocationStateStatus { initial, loading, success, failure }

class GeolocationState extends Equatable {
  const GeolocationState({
    this.status = GeolocationStateStatus.initial,
    this.errorMessage = '',
    this.position,
    this.currentUser,
    required this.userModel,
  });

  final GeolocationStateStatus status;
  final String errorMessage;
  final Position? position;
  final User? currentUser;
  final List<UserModel> userModel;

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        position,
        currentUser,
        userModel,
      ];

  GeolocationState copyWith({
    GeolocationStateStatus? status,
    String? errorMessage,
    Position? position,
    User? currentUser,
    List<UserModel>? userModel,
  }) {
    return GeolocationState(
      currentUser: currentUser ?? this.currentUser,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      position: position ?? this.position,
      userModel: userModel ?? this.userModel,
    );
  }
}
