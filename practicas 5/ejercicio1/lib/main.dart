import 'package:flutter/material.dart';

void main() {
  runApp(const BeautyApp());
}

class BeautyApp extends StatelessWidget {
  const BeautyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beauty Mood',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
        ),
        scaffoldBackgroundColor: const Color(0xFFFDF6FA),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFFFFD6E7),
          foregroundColor: Colors.black87,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/favoritos': (context) => const FavoritosPage(),
        '/rutina': (context) => const RutinaPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beauty Mood'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.favorite, size: 80, color: Colors.pinkAccent),
            const SizedBox(height: 20),
            const Text(
              'Bienvenida a tu app de maquillaje y autocuidado',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              'Desde aquí puedes ver tus productos favoritos y tu rutina beauty.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/favoritos');
              },
              child: const Text('Ver productos favoritos'),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RutinaPage(),
                  ),
                );
              },
              child: const Text('Ir a rutina beauty'),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> productos = [
      'Gloss rosa',
      'Colorete melocotón',
      'Máscara de pestañas',
      'Iluminador',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.brush, color: Colors.pink),
            title: Text(productos[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class RutinaPage extends StatelessWidget {
  const RutinaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rutina Beauty'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.check_circle, color: Colors.pink),
              title: Text('Limpiar la piel'),
            ),
            ListTile(
              leading: Icon(Icons.check_circle, color: Colors.pink),
              title: Text('Aplicar sérum'),
            ),
            ListTile(
              leading: Icon(Icons.check_circle, color: Colors.pink),
              title: Text('Usar crema hidratante'),
            ),
            ListTile(
              leading: Icon(Icons.check_circle, color: Colors.pink),
              title: Text('Maquillaje natural'),
            ),
          ],
        ),
      ),
    );
  }
}