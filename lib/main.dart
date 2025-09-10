import 'package:currency_converter/core/di/injection.dart';
import 'package:currency_converter/core/router/app_router.dart';
import 'package:currency_converter/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize logger
  AppLogger.initialize();
  
  try {
    await configureDependencies();
    await getIt.allReady(); // Wait for all async dependencies to be ready
    runApp(const MyApp());
  } catch (error, stackTrace) {
    AppLogger.error('Error initializing app', error, stackTrace);
    rethrow;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    return MaterialApp.router(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      routerConfig: appRouter.config(),
    );
  }
}
