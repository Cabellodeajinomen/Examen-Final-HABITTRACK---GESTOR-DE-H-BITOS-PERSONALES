/**
 * Archivo: statistics_screen.dart
 * Descripción: Muestra un resumen visual del progreso del usuario
 * con respecto a sus hábitos.
 * Creado por: Alex Rhoddo Pacheco
 */

import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estadisticas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Tarjeta que muestra el total de hábitos completados
            const Card(
              child: ListTile(
                title: Text('Habitos completados'),
                trailing: Text('15', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),

            const SizedBox(height: 20),

            // Tarjeta que muestra el porcentaje total de éxito
            const Card(
              child: ListTile(
                title: Text('Porcentaje de cumplimiento'),
                trailing: Text('75%', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              ),
            ),

            const SizedBox(height: 30),

            // Contenedor para futuros gráficos detallados
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

