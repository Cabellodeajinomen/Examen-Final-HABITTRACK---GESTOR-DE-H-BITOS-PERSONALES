/**
 * Archivo: home_screen.dart
 * Descripción: Pantalla principal con resumen de hoy, lista de hábitos
 * mejorada y barra de navegación inferior.
 * Creado por: Alex Rhoddo Pacheco
 */

import 'package:flutter/material.dart';
import 'create_habit_screen.dart';
import 'statistics_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Habitos'),
        centerTitle: true,
        // Avatar del usuario en el AppBar
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Tarjeta de resumen de hoy
          const Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Resumen de Hoy',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '2 de 3 habitos completados',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          const Text(
            'Tus Actividades',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Lista de hábitos con tarjetas mejoradas
          _buildHabitCard('Leer 30 minutos', 'Habito diario', Icons.menu_book, true),
          _buildHabitCard('Hacer ejercicio', 'Salud física', Icons.fitness_center, true),
          _buildHabitCard('Tomar agua', 'Hidratación', Icons.water_drop, false),
        ],
      ),
      
      // Botón flotante para añadir hábitos
      floatingActionButton: FloatingActionButton(
        heroTag: "add",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateHabitScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),

      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const StatisticsScreen()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Estadísticas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  // Widget auxiliar para construir las tarjetas de hábitos
  Widget _buildHabitCard(String title, String subtitle, IconData icon, bool completed) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: completed ? Colors.blue.shade100 : Colors.grey.shade200,
          child: Icon(icon, color: completed ? Colors.blue : Colors.grey),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(
          completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: completed ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}
