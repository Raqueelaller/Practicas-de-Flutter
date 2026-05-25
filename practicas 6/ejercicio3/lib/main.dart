import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruta Bonita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pinkAccent,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioScreen(),
        '/favoritos': (context) => const FavoritosScreen(),
        '/notas': (context) => const NotasScreen(),
      },
    );
  }
}

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Perfil perfil = Perfil(
      nombre: 'Raquel',
      ciudad: 'Málaga',
      frase: 'Programando con café, ganas y un poquito de brillo.',
      imagen:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=900&q=80',
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F7),
      appBar: AppBar(
        title: const Text('Mi espacio'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const Text(
              'Un rincón con mis planes favoritos',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Navega entre pantallas y descubre pequeños detalles.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            MenuCard(
              icon: Icons.person_rounded,
              title: 'Perfil',
              description: 'Datos personales mostrados en una nueva pantalla.',
              buttonText: 'Abrir perfil',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PerfilScreen(perfil: perfil),
                  ),
                );
              },
            ),
            const SizedBox(height: 18),
            MenuCard(
              icon: Icons.favorite_rounded,
              title: 'Favoritos',
              description: 'Una pantalla abierta mediante una ruta con nombre.',
              buttonText: 'Ver favoritos',
              onPressed: () {
                Navigator.pushNamed(context, '/favoritos');
              },
            ),
            const SizedBox(height: 18),
            MenuCard(
              icon: Icons.edit_note_rounded,
              title: 'Notas bonitas',
              description: 'Otra ruta nombrada dentro de la aplicación.',
              buttonText: 'Ver notas',
              onPressed: () {
                Navigator.pushNamed(context, '/notas');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Perfil {
  final String nombre;
  final String ciudad;
  final String frase;
  final String imagen;

  Perfil({
    required this.nombre,
    required this.ciudad,
    required this.frase,
    required this.imagen,
  });
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  const MenuCard({
    super.key,
    required this.icon,
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: Colors.pinkAccent.withOpacity(0.15),
              child: Icon(
                icon,
                size: 42,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 15.5,
                height: 1.4,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}

class PerfilScreen extends StatelessWidget {
  final Perfil perfil;

  const PerfilScreen({
    super.key,
    required this.perfil,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F7),
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: Image.network(
                perfil.imagen,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 9,
              shadowColor: Colors.pinkAccent.withOpacity(0.25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    Text(
                      perfil.nombre,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      perfil.ciudad,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      perfil.frase,
                      style: const TextStyle(
                        fontSize: 16.5,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded),
              label: const Text('Volver'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 14,
                ),
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

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDetalleScreen(
      titulo: 'Favoritos',
      icono: Icons.favorite_rounded,
      texto:
          'Mis favoritos son los planes tranquilos, las tardes con café, los paseos por Málaga y las aplicaciones con diseños bonitos.',
    );
  }
}

class NotasScreen extends StatelessWidget {
  const NotasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDetalleScreen(
      titulo: 'Notas bonitas',
      icono: Icons.edit_note_rounded,
      texto:
          'Una buena interfaz no solo tiene que funcionar bien, también debe ser clara, cómoda y agradable de usar.',
    );
  }
}

class SimpleDetalleScreen extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final String texto;

  const SimpleDetalleScreen({
    super.key,
    required this.titulo,
    required this.icono,
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Card(
            elevation: 9,
            shadowColor: Colors.pinkAccent.withOpacity(0.25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icono,
                    size: 80,
                    color: Colors.pinkAccent,
                  ),
                  const SizedBox(height: 20),
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
                      height: 1.5,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 26),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                    label: const Text('Volver'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}