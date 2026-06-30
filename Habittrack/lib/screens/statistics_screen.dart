/**
 * Archivo: statistics_screen.dart
 * Descripción: Muestra un resumen visual del progreso del usuario
 * con respecto a sus hábitos.
 * Creado por: Alex Rhoddo Pacheco
 */

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/habit.dart';

class StatisticsScreen extends StatelessWidget {
  final List<Habit> habits;
  
  const StatisticsScreen({super.key, required this.habits});

  @override
  Widget build(BuildContext context) {
    final totalHabits = habits.length;
    final completedHabits = habits.where((h) => h.isCompleted).length;
    final pendingHabits = totalHabits - completedHabits;
    final percentage = totalHabits > 0 ? (completedHabits / totalHabits * 100).toStringAsFixed(0) : '0';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estadisticas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildStatCard('Total', '$totalHabits', Colors.blue),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildStatCard('Completados', '$completedHabits', Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildStatCard('Progreso Actual', '$percentage%', Colors.orange, isLarge: true),
            
            const SizedBox(height: 40),
            
            const Text(
              'Distribución de Hábitos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            
            const SizedBox(height: 20),

            // Gráfico de Pie con fl_chart
            SizedBox(
              height: 200,
              child: totalHabits > 0 
                ? PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          color: Colors.green,
                          value: completedHabits.toDouble(),
                          title: 'Completos',
                          radius: 50,
                          titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        PieChartSectionData(
                          color: Colors.blue.shade100,
                          value: pendingHabits.toDouble(),
                          title: 'Pendientes',
                          radius: 50,
                          titleStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ],
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                    ),
                  )
                : const Center(child: Text('No hay datos para mostrar')),
            ),
            
            const SizedBox(height: 30),
            
            // Leyenda simple
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(Colors.green, 'Completados'),
                const SizedBox(width: 20),
                _buildLegendItem(Colors.blue.shade100, 'Pendientes'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color, {bool isLarge = false}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: isLarge ? 20 : 16, horizontal: 12),
        child: Column(
          children: [
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: isLarge ? 32 : 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

