import 'package:flutter/material.dart';

void main() {
  runApp(const BeautyGlowApp());
}

class BeautyGlowApp extends StatelessWidget {
  const BeautyGlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beauty Glow',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE8A0BF),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8FC),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5F3B4B),
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF6D4255),
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            height: 1.5,
            color: Color(0xFF6F5A64),
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 3,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFFFFE6F0),
          foregroundColor: Color(0xFF6D4255),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE8A0BF),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF1F1720),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF2A1E2A),
          foregroundColor: Color(0xFFFFD9E8),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          color: const Color(0xFF2B222C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      home: const PantallaBeauty(),
    );
  }
}

class PantallaBeauty extends StatelessWidget {
  const PantallaBeauty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beauty Glow'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool esPantallaGrande = constraints.maxWidth >= 800;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: esPantallaGrande
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: ColumnaPrincipal(),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: ColumnaSecundaria(),
                      ),
                    ],
                  )
                : const Column(
                    children: [
                      ColumnaPrincipal(),
                      SizedBox(height: 16),
                      ColumnaSecundaria(),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

class ColumnaPrincipal extends StatelessWidget {
  const ColumnaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CabeceraBonita(),
        SizedBox(height: 16),
        TarjetaRutinaDestacada(),
        SizedBox(height: 16),
        TarjetaPasosRutina(),
      ],
    );
  }
}

class ColumnaSecundaria extends StatelessWidget {
  const ColumnaSecundaria({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TarjetaConsejos(),
        SizedBox(height: 16),
        TarjetaProductosFavoritos(),
      ],
    );
  }
}

class CabeceraBonita extends StatelessWidget {
  const CabeceraBonita({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFD7E8),
            Color(0xFFFFEEF5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.auto_awesome_rounded,
              size: 52,
              color: Color(0xFFB9688F),
            ),
            SizedBox(height: 16),
            Text(
              'Rutina glow de mañana',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6D4255),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Una app más bonita, suave y cuidada visualmente',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF8C6273),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TarjetaRutinaDestacada extends StatelessWidget {
  const TarjetaRutinaDestacada({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rutina destacada', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            const Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xFFFFE6F0),
                  child: Icon(
                    Icons.spa_rounded,
                    color: Color(0xFFB9688F),
                    size: 30,
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Piel hidratada y luminosa',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Ideal para empezar el día con un aspecto fresco y natural.',
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                Chip(
                  avatar: Icon(Icons.water_drop_rounded, size: 18),
                  label: Text('Hidratación'),
                ),
                Chip(
                  avatar: Icon(Icons.wb_sunny_rounded, size: 18),
                  label: Text('Protección solar'),
                ),
                Chip(
                  avatar: Icon(Icons.favorite_rounded, size: 18),
                  label: Text('Autocuidado'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TarjetaPasosRutina extends StatelessWidget {
  const TarjetaPasosRutina({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Pasos de la rutina',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16),
            PasoRutina(
              icono: Icons.soap_rounded,
              titulo: 'Limpiador',
              descripcion: 'Limpia el rostro suavemente para eliminar impurezas.',
            ),
            SizedBox(height: 12),
            PasoRutina(
              icono: Icons.water_drop_rounded,
              titulo: 'Sérum hidratante',
              descripcion: 'Aporta agua y ayuda a mantener la piel jugosa.',
            ),
            SizedBox(height: 12),
            PasoRutina(
              icono: Icons.face_rounded,
              titulo: 'Crema facial',
              descripcion: 'Sella la hidratación y deja la piel más suave.',
            ),
            SizedBox(height: 12),
            PasoRutina(
              icono: Icons.wb_sunny_rounded,
              titulo: 'Protector solar',
              descripcion: 'Protege la piel y es esencial cada mañana.',
            ),
          ],
        ),
      ),
    );
  }
}

class PasoRutina extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String descripcion;

  const PasoRutina({
    super.key,
    required this.icono,
    required this.titulo,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFFFEEF5),
          child: Icon(
            icono,
            color: const Color(0xFFB9688F),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(descripcion),
            ],
          ),
        ),
      ],
    );
  }
}

class TarjetaConsejos extends StatelessWidget {
  const TarjetaConsejos({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Consejos beauty',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 14),
            ConsejoItem(texto: 'Usa agua tibia para no irritar la piel.'),
            ConsejoItem(texto: 'Aplica los productos de más ligero a más denso.'),
            ConsejoItem(texto: 'No olvides el protector solar aunque esté nublado.'),
          ],
        ),
      ),
    );
  }
}

class ConsejoItem extends StatelessWidget {
  final String texto;

  const ConsejoItem({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.favorite_border_rounded,
            color: Color(0xFFE08AAF),
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(texto)),
        ],
      ),
    );
  }
}

class TarjetaProductosFavoritos extends StatelessWidget {
  const TarjetaProductosFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    final productos = [
      {'nombre': 'Limpiador suave', 'icono': Icons.soap_rounded},
      {'nombre': 'Sérum glow', 'icono': Icons.water_drop_rounded},
      {'nombre': 'Crema nutritiva', 'icono': Icons.face_rounded},
      {'nombre': 'SPF diario', 'icono': Icons.wb_sunny_rounded},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Favoritos', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 14),
            ...productos.map(
              (producto) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFFFFEEF5),
                  child: Icon(
                    producto['icono'] as IconData,
                    color: const Color(0xFFB9688F),
                  ),
                ),
                title: Text(producto['nombre'] as String),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}