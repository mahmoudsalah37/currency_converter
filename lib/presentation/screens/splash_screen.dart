import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/core/di/injection.dart';
import 'package:currency_converter/core/router/app_router.dart';
import 'package:currency_converter/presentation/bloc/splash/splash_bloc.dart';
import 'package:currency_converter/presentation/bloc/splash/splash_event.dart';
import 'package:currency_converter/presentation/bloc/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<SplashBloc> _splashBlocFuture;

  @override
  void initState() {
    super.initState();
    _splashBlocFuture = getIt.getAsync<SplashBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SplashBloc>(
      future: _splashBlocFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return BlocProvider.value(
            value: snapshot.data!..add(const InitializeApp()),
            child: BlocListener<SplashBloc, SplashState>(
              listener: (context, state) {
                state.maybeWhen(
                  loaded: () => context.router.replace(const ConverterRoute()),
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                  },
                  orElse: () {},
                );
              },
              child: Scaffold(
                backgroundColor: const Color(0xFF4A90E2),
                body: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 8),
                    ),
                    child: const Center(
                      child: Text(
                        'CC',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error loading SplashBloc: ${snapshot.error}'),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
