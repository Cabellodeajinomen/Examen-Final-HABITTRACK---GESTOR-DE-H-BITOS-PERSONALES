/**
 * Archivo: create_habit_screen.dart
 * Descripción: Interfaz para que el usuario registre nuevos hábitos.
 * Permite ingresar nombre y una breve descripción.
 * Creado por: Alex Rhoddo Pacheco
 */

import 'package:flutter/material.dart';

class CreateHabitScreen extends StatelessWidget {
  const CreateHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Habito'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Campo de entrada para el nombre del nuevo hábito
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nombre del habito',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Campo de entrada para detalles adicionales o notas
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Descripcion',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            // Botón para procesar el guardado del hábito
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Muestra una notificación emergente confirmando el guardado
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Habito guardado satisfactoriamente'),
                    ),
                  );
                },
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

