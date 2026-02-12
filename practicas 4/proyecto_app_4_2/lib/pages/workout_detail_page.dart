import 'package:flutter/material.dart';
import '../widgets/cute_card.dart';

class WorkoutDetailPage extends StatelessWidget {
  final Map<String, String> workout;

  const WorkoutDetailPage({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(workout["title"] ?? "Rutina")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CuteCard(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 210,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
                    child: Image.network(
                      workout["img"]!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Center(
                        child: Icon(Icons.broken_image_rounded, size: 50),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(workout["title"]!, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                      const SizedBox(height: 6),
                      Text(workout["subtitle"] ?? ""),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _pill(cs, Icons.local_fire_department_rounded, workout["kcal"] ?? "—"),
                          const SizedBox(width: 10),
                          _pill(cs, Icons.format_list_bulleted_rounded, workout["steps"] ?? "—"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          CuteCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Plan rápido", style: TextStyle(fontWeight: FontWeight.w900)),
                SizedBox(height: 8),
                Text("1) Calentamiento 2 min"),
                Text("2) Circuito principal"),
                Text("3) Estiramientos 2 min"),
              ],
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Rutina iniciada")),
              );
            },
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text("Empezar"),
          ),
        ],
      ),
    );
  }

  Widget _pill(ColorScheme cs, IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: cs.primaryContainer.withOpacity(0.45),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: cs.primary),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
