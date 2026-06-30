/**
 * Archivo: create_habit_screen.dart
 * Descripción: Interfaz para que el usuario registre nuevos hábitos.
 * Permite ingresar nombre y una breve descripción.
 * Creado por: Alex Rhoddo Pacheco
 */

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../data/habit_data.dart';

class CreateHabitScreen extends StatefulWidget {
  const CreateHabitScreen({super.key});

  @override
  State<CreateHabitScreen> createState() => _CreateHabitScreenState();
}

class _CreateHabitScreenState extends State<CreateHabitScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  void _saveHabit() {
    final title = _titleController.text.trim();
    final subtitle = _subtitleController.text.trim();

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El nombre del hábito es obligatorio')),
      );
      return;
    }

    final newHabit = Habit(
      id: DateTime.now().toString(),
      title: title,
      subtitle: subtitle.isEmpty ? 'Sin descripción' : subtitle,
    );

    HabitData.habits.add(newHabit);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Habito guardado satisfactoriamente')),
    );

    Navigator.pop(context);
  }

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
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Nombre del habito',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _subtitleController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Descripcion',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveHabit,
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

