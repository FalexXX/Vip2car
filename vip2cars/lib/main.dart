import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme.dart';
import 'ui/splash_screen.dart';
import 'ui/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VIP2CarsApp());
}

class VIP2CarsApp extends StatelessWidget {
  const VIP2CarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      colorScheme: AppTheme.schemeLight,
      textTheme: GoogleFonts.poppinsTextTheme(),
      useMaterial3: true,
      scaffoldBackgroundColor: AppTheme.schemeLight.background,
      inputDecorationTheme: AppTheme.inputTheme,
      appBarTheme: AppTheme.appBarTheme,
      elevatedButtonTheme: AppTheme.buttonTheme,
    );

    return MaterialApp(
      title: 'VIP2CARS',
      debugShowCheckedModeBanner: false,
      theme: baseTheme,
      // Si quieres dark mode, define AppTheme.schemeDark y agrega themeMode: ThemeMode.system
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (_) => const SplashScreen(),
        LoginScreen.route: (_) => const LoginScreen(),
      },
    );
  }
}
