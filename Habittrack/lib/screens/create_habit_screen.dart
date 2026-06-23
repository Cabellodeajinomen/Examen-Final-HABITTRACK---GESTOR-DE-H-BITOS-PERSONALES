import 'package:flutter/material.dart';

class CreateHabitScreen extends StatelessWidget {
  const CreateHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Hábito')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Nombre del hábito')),
            SizedBox(height: 20),
            // Aquí irían más campos como frecuencia, etc.
          ],
        ),
      ),
    );
  }
}
