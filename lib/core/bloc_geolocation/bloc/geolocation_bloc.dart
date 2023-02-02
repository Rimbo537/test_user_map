import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_user_map/data/repositories/geolocation/geolocation_repository.dart';
import 'package:test_user_map/src/domain/models/user_model.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  GeolocationBloc({
    required GeolocationRepository geolocationRepo,
  })  : _geolocationRepo = geolocationRepo,
        super(const GeolocationState(userModel: <UserModel>[])) {
    on<LoadGeolocation>(_onLoadAuth);
    on<GetData>(_onGetData);
  }
  final GeolocationRepository _geolocationRepo;

  Future<void> _onLoadAuth(
    LoadGeolocation event,
    Emitter<GeolocationState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: GeolocationStateStatus.loading,
        ),
      );

      final position = await _geolocationRepo.getCurrentLocation();
      final currentUser = await _geolocationRepo.getCurrentUser();

      return emit(
        state.copyWith(
          position: position,
          currentUser: currentUser,
          status: GeolocationStateStatus.success,
        ),
      );
    } catch (e) {
      return emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: GeolocationStateStatus.failure,
        ),
      );
    }
  }

  Future<void> _onGetData(
    GetData event,
    Emitter<GeolocationState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: GeolocationStateStatus.loading,
        ),
      );

      final data = await _geolocationRepo.getUserData();

      return emit(
        state.copyWith(
          userModel: data,
          status: GeolocationStateStatus.success,
        ),
      );
    } catch (e) {
      return emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: GeolocationStateStatus.failure,
        ),
      );
    }
  }
}
