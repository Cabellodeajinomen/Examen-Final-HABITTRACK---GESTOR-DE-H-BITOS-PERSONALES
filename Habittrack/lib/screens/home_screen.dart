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
import '../models/habit.dart';
import '../data/habit_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Habit> _habits = HabitData.habits;

  int get _completedHabits => _habits.where((h) => h.isCompleted).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Habitos'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Resumen de Hoy',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$_completedHabits de ${_habits.length} habitos completados',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tus Actividades',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _habits.length,
              itemBuilder: (context, index) {
                final habit = _habits[index];
                return _buildHabitCard(habit);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "add",
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateHabitScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StatisticsScreen(habits: _habits),
              ),
            );
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

  Widget _buildHabitCard(Habit habit) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: habit.isCompleted ? Colors.blue.shade100 : Colors.grey.shade200,
          child: Icon(
            _getIconForHabit(habit.title),
            color: habit.isCompleted ? Colors.blue : Colors.grey,
          ),
        ),
        title: Text(habit.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(habit.subtitle),
        trailing: Checkbox(
          value: habit.isCompleted,
          onChanged: (value) {
            setState(() {
              habit.isCompleted = value ?? false;
            });
          },
          activeColor: Colors.green,
        ),
      ),
    );
  }

  IconData _getIconForHabit(String title) {
    if (title.toLowerCase().contains('leer')) return Icons.menu_book;
    if (title.toLowerCase().contains('ejercicio')) return Icons.fitness_center;
    if (title.toLowerCase().contains('agua')) return Icons.water_drop;
    return Icons.task_alt;
  }
}
