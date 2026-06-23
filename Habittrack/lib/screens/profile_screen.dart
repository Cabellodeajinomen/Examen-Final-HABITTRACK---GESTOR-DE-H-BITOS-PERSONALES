/**
 * Archivo: profile_screen.dart
 * Descripción: Pantalla de perfil del usuario donde se muestra su información
 * personal y opciones de configuración.
 * Creado por: Alex Rhoddo Pacheco
 */

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Avatar grande del usuario
            const CircleAvatar(
              radius: 60,
              child: Icon(Icons.person, size: 80),
            ),
            const SizedBox(height: 20),
            // Información del usuario
            const Text(
              'Alex Rhoddo Pacheco',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'alex.rhoddo@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            // Opciones de configuración (estáticas)
            const Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Configuración'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notificaciones'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Botón de cierre de sesión
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // Regresa al login quitando todas las pantallas previas
                  Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                ),
                child: const Text('Cerrar Sesión'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
