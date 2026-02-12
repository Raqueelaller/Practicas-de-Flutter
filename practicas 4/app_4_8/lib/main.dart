import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFFE91E63);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cards Layout',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        scaffoldBackgroundColor: const Color(0xFFFFF1F6),
      ),
      home: const CardLayoutScreen(),
    );
  }
}

class CardLayoutScreen extends StatelessWidget {
  const CardLayoutScreen({super.key});

  void mostrarMensaje(BuildContext context, String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(texto)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards en Filas y Columnas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: buildCard(
                      context,
                      'Card 1',
                      Icons.star,
                      Colors.pink,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: buildCard(
                      context,
                      'Card 2',
                      Icons.favorite,
                      Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: buildCard(context, 'Card 3', Icons.home, Colors.pink)),
                  const SizedBox(width: 10),
                  Expanded(child: buildCard(context, 'Card 4', Icons.person, Colors.purple)),
                  const SizedBox(width: 10),
                  Expanded(child: buildCard(context, 'Card 5', Icons.settings, Colors.pinkAccent)),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    child: buildCard(
                      context,
                      'Card ${index + 6}',
                      Icons.widgets,
                      Colors.pink,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, IconData icon, Color color) {
    return InkWell(
      onTap: () => mostrarMensaje(context, title),
      borderRadius: BorderRadius.circular(18),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 30, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
