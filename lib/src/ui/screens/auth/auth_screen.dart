import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_map/core/bloc/auth_bloc.dart';
import 'package:test_user_map/src/ui/screens/main/main_screen.dart';
import 'package:test_user_map/src/ui/widgets/auth/auth_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          // Navigating to the dashboard screen if the user is authenticated
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
        }
        if (state is AuthError) {
          // Displaying the error message if the user is not authenticated
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is Loading) {
          // Displaying the loading indicator while the user is signing up
          return const Center(child: CircularProgressIndicator());
        }
//////////////// мб удалить иф ////////////////////////////////////////
        if (state is UnAuthenticated) {
          // Displaying the sign up form if the user is not authenticated
          return const AuthWidget();
        }
        return Container();
      },
    );
  }
}
