import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escapadas Bonitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pinkAccent,
      ),
      home: const InicioScreen(),
    );
  }
}

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F7),
      appBar: AppBar(
        title: const Text('Escapadas bonitas'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const Text(
              'Pequeños planes para desconectar',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Elige un plan y descubre más detalles.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            PlanCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=900&q=80',
              title: 'Atardecer en la playa',
              description:
                  'Un paseo tranquilo junto al mar, con arena suave y cielo rosa.',
              buttonText: 'Ver plan',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlayaScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            PlanCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=900&q=80',
              title: 'Café de tarde',
              description:
                  'Una merienda bonita, café calentito y un ratito para respirar.',
              buttonText: 'Ver plan',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CafeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  const PlanCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      shadowColor: Colors.pinkAccent.withOpacity(0.25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            imageUrl,
            height: 210,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15.5,
                    height: 1.4,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: onPressed,
                    icon: const Icon(Icons.favorite_rounded),
                    label: Text(buttonText),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlayaScreen extends StatelessWidget {
  const PlayaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DetallePlanScreen(
      titulo: 'Atardecer en la playa',
      imagen:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=900&q=80',
      texto:
          'La playa al atardecer siempre tiene algo especial. La luz se vuelve suave, el mar parece más tranquilo y todo invita a caminar sin prisa. Es un plan perfecto para hacer fotos bonitas, respirar aire fresco y terminar el día con calma.',
    );
  }
}

class CafeScreen extends StatelessWidget {
  const CafeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DetallePlanScreen(
      titulo: 'Café de tarde',
      imagen:
          'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=900&q=80',
      texto:
          'Una cafetería bonita, una bebida calentita y un rato agradable pueden arreglar cualquier tarde. Este plan es ideal para desconectar, hablar con alguien especial o simplemente sentarse a disfrutar un momento tranquilo.',
    );
  }
}

class DetallePlanScreen extends StatelessWidget {
  final String titulo;
  final String imagen;
  final String texto;

  const DetallePlanScreen({
    super.key,
    required this.titulo,
    required this.imagen,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F7),
      appBar: AppBar(
        title: Text(titulo),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: Image.network(
                imagen,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              texto,
              style: const TextStyle(
                fontSize: 16.5,
                height: 1.55,
                color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded),
              label: const Text('Volver'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}