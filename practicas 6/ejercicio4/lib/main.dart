import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood App',
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
        title: const Text('Mood App'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.network(
                'https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=900&q=80',
                height: 230,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Crea un día con buen mood',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Una pequeña app para guardar inspiración, mirar ideas bonitas y personalizar tu espacio.',
              style: TextStyle(
                fontSize: 16.5,
                height: 1.4,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            InicioButton(
              icono: Icons.photo_library_rounded,
              texto: 'Abrir galería',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GaleriaScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 14),
            InicioButton(
              icono: Icons.settings_rounded,
              texto: 'Abrir ajustes',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AjustesScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            const NotaTecnicaCard(),
          ],
        ),
      ),
    );
  }
}

class InicioButton extends StatelessWidget {
  final IconData icono;
  final String texto;
  final VoidCallback onPressed;

  const InicioButton({
    super.key,
    required this.icono,
    required this.texto,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icono),
      label: Text(texto),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 52),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}

class GaleriaScreen extends StatelessWidget {
  const GaleriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagenes = [
      'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=900&q=80',
      'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=900&q=80',
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=900&q=80',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F7),
      appBar: AppBar(
        title: const Text('Galería'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const Text(
              'Inspiración para guardar',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            for (final imagen in imagenes) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  imagen,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
            ],
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

class AjustesScreen extends StatelessWidget {
  const AjustesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F7),
      appBar: AppBar(
        title: const Text('Ajustes'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const Text(
              'Preferencias',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            const AjusteCard(
              icono: Icons.palette_rounded,
              titulo: 'Tema visual',
              descripcion: 'Colores suaves y estilo claro.',
            ),
            const SizedBox(height: 14),
            const AjusteCard(
              icono: Icons.notifications_rounded,
              titulo: 'Notificaciones',
              descripcion: 'Recordatorios activados para no olvidar nada.',
            ),
            const SizedBox(height: 14),
            const AjusteCard(
              icono: Icons.language_rounded,
              titulo: 'Idioma',
              descripcion: 'Español.',
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded),
              label: const Text('Volver'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 52),
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

class AjusteCard extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String descripcion;

  const AjusteCard({
    super.key,
    required this.icono,
    required this.titulo,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shadowColor: Colors.pinkAccent.withOpacity(0.22),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.pinkAccent.withOpacity(0.15),
          child: Icon(
            icono,
            color: Colors.pinkAccent,
          ),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.pinkAccent,
          ),
        ),
        subtitle: Text(descripcion),
      ),
    );
  }
}

class NotaTecnicaCard extends StatelessWidget {
  const NotaTecnicaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 7,
      shadowColor: Colors.pinkAccent.withOpacity(0.22),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Padding(
        padding: EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.lightbulb_rounded,
              color: Colors.pinkAccent,
              size: 30,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'MaterialPageRoute crea una transición suave entre pantallas. '
                'Más adelante, con Provider, Riverpod o Bloc, se podrán compartir datos globalmente sin pasarlos manualmente entre pantallas.',
                style: TextStyle(
                  fontSize: 15.5,
                  height: 1.45,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}