/**
 * Archivo: statistics_screen.dart
 * Descripción: Muestra un resumen visual del progreso del usuario
 * con respecto a sus hábitos.
 * Creado por: Alex Rhoddo Pacheco
 */

import 'package:flutter/material.dart';
import '../models/habit.dart';

class StatisticsScreen extends StatelessWidget {
  final List<Habit> habits;
  
  const StatisticsScreen({super.key, required this.habits});

  @override
  Widget build(BuildContext context) {
    final totalHabits = habits.length;
    final completedHabits = habits.where((h) => h.isCompleted).length;
    final percentage = totalHabits > 0 ? (completedHabits / totalHabits * 100).toStringAsFixed(0) : '0';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estadisticas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text('Total de hábitos'),
                trailing: Text('$totalHabits', style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text('Habitos completados'),
                trailing: Text('$completedHabits', style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                title: const Text('Porcentaje de cumplimiento'),
                trailing: Text('$percentage%', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 200,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade200),
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue.shade50,
              ),
              child: const Text(
                'Grafico semanal de progreso\n(Integración con fl_chart en desarrollo)',
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

