import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_map/core/bloc/auth_bloc.dart';
import 'package:test_user_map/core/bloc_geolocation/bloc/geolocation_bloc.dart';
import 'package:test_user_map/data/repositories/auth/auth_repository.dart';
import 'package:test_user_map/data/repositories/geolocation/geolocation_repository.dart';
import 'package:test_user_map/src/ui/screens/auth/auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider<GeolocationRepository>(
          create: (context) => GeolocationRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => GeolocationBloc(
                geolocationRepo: context.read<GeolocationRepository>())
              ..add(const LoadGeolocation()),
          ),
        ],
        child: MaterialApp(
          title: 'Test User Map',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AuthScreen(),
        ),
      ),
    );
  }
}
