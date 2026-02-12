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
      title: 'Galería de Cards',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        scaffoldBackgroundColor: const Color(0xFFFFF1F6),
      ),
      home: const CardGalleryScreen(),
    );
  }
}

class CardGalleryScreen extends StatelessWidget {
  const CardGalleryScreen({super.key});

  final List<Map<String, String>> items = const [
    {"title": "Montañas", "subtitle": "Paisaje natural", "image": "https://picsum.photos/400/300?random=1"},
    {"title": "Playa", "subtitle": "Arena y mar", "image": "https://picsum.photos/400/300?random=2"},
    {"title": "Ciudad", "subtitle": "Vida urbana", "image": "https://picsum.photos/400/300?random=3"},
    {"title": "Bosque", "subtitle": "Naturaleza verde", "image": "https://picsum.photos/400/300?random=4"},
    {"title": "Desierto", "subtitle": "Arena infinita", "image": "https://picsum.photos/400/300?random=5"},
    {"title": "Lago", "subtitle": "Agua cristalina", "image": "https://picsum.photos/400/300?random=6"},
  ];

  void mostrarMensaje(BuildContext context, String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(texto)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galería de Cards"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final item = items[index];

            return InkWell(
              onTap: () => mostrarMensaje(context, item["title"]!),
              borderRadius: BorderRadius.circular(18),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(
                        item["image"]!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 50),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.image, color: Colors.pink),
                      title: Text(
                        item["title"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(item["subtitle"]!),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
