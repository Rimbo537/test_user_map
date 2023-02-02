import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_map/core/bloc/auth_bloc.dart';
import 'package:test_user_map/data/repositories/auth/auth_repository.dart';
import 'package:test_user_map/src/ui/screens/main/main_screen.dart';
import 'package:test_user_map/src/ui/widgets/auth/auth_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStateStatus.success) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => BlocProvider<AuthBloc>(
                create: (context) => AuthBloc(authRepository: AuthRepository()),
                child: const MainScreen(),
              ),
            ),
          );
        }
        if (state.status == AuthStateStatus.failure &&
            state.errorMessage.isNotEmpty) {
          context.showErrorBar<String>(
            content: Text(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state.status == AuthStateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const AuthWidget();
        }
      },
    );
  }
}
