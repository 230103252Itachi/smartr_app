import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/splash_screen2.dart';
import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/otp_screen.dart';
import 'screens/reset_password_email_screen.dart';
import 'screens/reset_password_confirm_screen.dart';

void main() {
  runApp(const EmpowerEDApp());
}

class EmpowerEDApp extends StatelessWidget {
  const EmpowerEDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EmpowerED',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      initialRoute: '/splash1',
      routes: {
        '/splash1': (_) => const SplashScreen(),
        '/splash2': (_) => const SplashScreen2(),
        '/register': (_) => const RegisterScreen(),
        '/login': (_) => const LoginScreen(),
        '/otp': (_) => const OtpScreen(),
        '/reset_email': (_) => const ResetPasswordEmailScreen(),
        '/reset_confirm': (_) => const ResetPasswordConfirmScreen(),
      },
    );
  }
}
