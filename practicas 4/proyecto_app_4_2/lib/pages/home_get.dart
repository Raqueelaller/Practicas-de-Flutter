import 'package:flutter/material.dart';
import '../widgets/cute_card.dart';
import 'workout_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

final workouts = const [
  {
    "title": "Glutes",
    "subtitle": "12 min • Easy",
    "img": "https://images.unsplash.com/photo-1518611012118-696072aa579a",
    "kcal": "140 kcal",
    "steps": "6 ejercicios"
  },
  {
    "title": "Abs",
    "subtitle": "10 min • Medium",
    "img": "https://images.unsplash.com/photo-1571902943202-507ec2618e8f",
    "kcal": "120 kcal",
    "steps": "5 ejercicios"
  },
  {
    "title": "Full Body",
    "subtitle": "20 min • Medium",
    "img": "https://images.unsplash.com/photo-1549576490-b0b4831ef60a",
    "kcal": "220 kcal",
    "steps": "8 ejercicios"
  },
];



  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(index == 0 ? "Hola, Raquel" : index == 1 ? "Rutinas" : "Perfil"),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Notificaciones")),
              );
            },
            icon: const Icon(Icons.notifications_none_rounded),
          )
        ],
      ),
      body: IndexedStack(
        index: index,
        children: [
          _HomeTab(
            workouts: workouts,
            onOpen: (w) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => WorkoutDetailPage(workout: w)),
              );
            },
          ),
          _WorkoutsTab(
            workouts: workouts,
            onOpen: (w) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => WorkoutDetailPage(workout: w)),
              );
            },
          ),
          _ProfileTab(color: cs.primary),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (v) => setState(() => index = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: "Home"),
          NavigationDestination(icon: Icon(Icons.fitness_center_rounded), label: "Rutinas"),
          NavigationDestination(icon: Icon(Icons.person_rounded), label: "Perfil"),
        ],
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  final List<Map<String, String>> workouts;
  final void Function(Map<String, String> w) onOpen;

  const _HomeTab({required this.workouts, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        CuteCard(
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: cs.primaryContainer.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.favorite_rounded, color: cs.primary),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Objetivo de hoy", style: TextStyle(fontWeight: FontWeight.w900)),
                    SizedBox(height: 4),
                    Text("Moverte un poquito y cerrar el día con energía"),
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
            children: [
              const Text("Buscar rutina", style: TextStyle(fontWeight: FontWeight.w900)),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Ej: abs, glutes, full body...",
                  prefixIcon: const Icon(Icons.search_rounded),
                  filled: true,
                  fillColor: cs.primaryContainer.withOpacity(0.35),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Text("Recomendadas", style: TextStyle(color: cs.primary, fontWeight: FontWeight.w900)),
        const SizedBox(height: 10),
        SizedBox(
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: workouts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              final w = workouts[i];
              return SizedBox(
                width: 250,
                child: CuteCard(
                  onTap: () => onOpen(w),
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
                          child: Image.network(
                            w["img"]!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const Center(
                              child: Icon(Icons.broken_image_rounded, size: 40),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(w["title"]!, style: const TextStyle(fontWeight: FontWeight.w900)),
                            const SizedBox(height: 4),
                            Text(w["subtitle"]!),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
        Text("Para empezar suavecito", style: TextStyle(color: cs.primary, fontWeight: FontWeight.w900)),
        const SizedBox(height: 10),
        ...workouts.map((w) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CuteCard(
              onTap: () => onOpen(w),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: cs.primaryContainer.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.play_arrow_rounded, color: cs.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(w["title"]!, style: const TextStyle(fontWeight: FontWeight.w900)),
                        const SizedBox(height: 2),
                        Text(w["subtitle"]!),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _WorkoutsTab extends StatelessWidget {
  final List<Map<String, String>> workouts;
  final void Function(Map<String, String> w) onOpen;

  const _WorkoutsTab({required this.workouts, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: workouts
          .map(
            (w) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CuteCard(
                onTap: () => onOpen(w),
                child: ListTile(
                  leading: const Icon(Icons.fitness_center_rounded),
                  title: Text(w["title"]!, style: const TextStyle(fontWeight: FontWeight.w900)),
                  subtitle: Text("${w["subtitle"]} • ${w["kcal"]}"),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  final Color color;
  const _ProfileTab({required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CuteCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(radius: 34, backgroundColor: color.withOpacity(0.2), child: Icon(Icons.person_rounded, color: color, size: 34)),
            const SizedBox(height: 12),
            const Text("Mi perfil", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            const SizedBox(height: 4),
            const Text("Aquí podrías poner tus datos, objetivos y progreso."),
          ],
        ),
      ),
    );
  }
}
