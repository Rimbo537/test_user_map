import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_map/core/bloc_geolocation/bloc/geolocation_bloc.dart';
import 'package:test_user_map/data/repositories/user/user_repository.dart';
import 'package:test_user_map/resources/app_strings.dart';
import 'package:test_user_map/resources/app_styles.dart';
import 'package:test_user_map/src/domain/models/user_model.dart';

class CreateUserButton extends StatelessWidget {
  const CreateUserButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeolocationBloc, GeolocationState>(
      listener: (context, state) {
        if (state.status == GeolocationStateStatus.failure &&
            state.errorMessage.isNotEmpty) {
          context.showErrorBar<String>(
            content: Text(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state.status == GeolocationStateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Positioned(
            bottom: 20,
            right: 20,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: AppStyles.createUserButton,
                onPressed: () {
                  final user = UserModel(
                    id: state.currentUser?.uid,
                    email: state.currentUser?.email,
                    photoUrl: state.currentUser?.photoURL,
                    latitude: state.position?.latitude,
                    longitude: state.position?.longitude,
                    displayName: state.currentUser?.displayName,
                  );

                  UserRepository().createUser(user);
                },
                child: const Text(MainAppStrings.createUser),
              ),
            ),
          );
        }
      },
    );
  }
}
