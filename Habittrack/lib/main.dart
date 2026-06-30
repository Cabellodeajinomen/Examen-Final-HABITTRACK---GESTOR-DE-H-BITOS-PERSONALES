/**
 * Archivo: main.dart
 * Descripción: Punto de entrada principal de la aplicación HabitTrack. 
 * Configura el tema global con Google Fonts y las rutas principales.
 * Creado por: Alex Rhoddo Pacheco
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/create_habit_screen.dart';
import 'screens/statistics_screen.dart';

void main() {
  runApp(const HabitTrackApp());
}

class HabitTrackApp extends StatelessWidget {
  const HabitTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HabitTrack',
      theme: ThemeData(
        // Uso de Google Fonts para una tipografía más moderna
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
      },
    );
  }
}
