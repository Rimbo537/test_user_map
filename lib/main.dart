import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_map/core/bloc/auth_bloc.dart';
import 'package:test_user_map/data/repositories/auth_repositories.dart';
import 'package:test_user_map/src/ui/screens/auth/auth_screen.dart';
import 'package:test_user_map/src/ui/screens/main/main_screen.dart';
import 'package:test_user_map/src/ui/screens/profile/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          title: 'Test User Map',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AuthScreen(),
          // AuthScreen
          // MainScreen
          // ProfileScreen
        ),
      ),
    );
  }
}
