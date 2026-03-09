import 'package:flutter/material.dart';

void main() {
  runApp(const RutinaGlowApp());
}

class RutinaGlowApp extends StatelessWidget {
  const RutinaGlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rutina Glow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF7FB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFEFA6C8),
        ),
      ),
      home: const PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rutina Glow'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFE4EF),
        foregroundColor: const Color(0xFF7A4E61),
      ),
      body: ListView(
        children: const [
          SeccionCabecera(),
          SeccionTitulo(),
          SeccionBotones(),
          SeccionTexto(),
          SeccionConsejos(),
        ],
      ),
    );
  }
}

class SeccionCabecera extends StatelessWidget {
  const SeccionCabecera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFD6E7),
            Color(0xFFFFEEF5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.spa_rounded,
              size: 72,
              color: Color(0xFFB86B8E),
            ),
            SizedBox(height: 12),
            Text(
              'Momento de autocuidado',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7A4E61),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Skincare, calma y energía bonita',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF946879),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeccionTitulo extends StatelessWidget {
  const SeccionTitulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rutina facial de mañana',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color(0xFF5C3A4A),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Piel suave, luminosa e hidratada',
                  style: TextStyle(
                    color: Color(0xFF9A7B89),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.favorite,
            color: Color(0xFFE987B3),
          ),
          SizedBox(width: 6),
          Text(
            '98',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF7A4E61),
            ),
          ),
        ],
      ),
    );
  }
}

class SeccionBotones extends StatelessWidget {
  const SeccionBotones({super.key});

  Widget construirBoton(IconData icono, String texto) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icono,
          color: const Color(0xFFCC7FA1),
          size: 30,
        ),
        const SizedBox(height: 8),
        Text(
          texto,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF7A4E61),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          construirBoton(Icons.soap_rounded, 'Limpiar'),
          construirBoton(Icons.water_drop_rounded, 'Hidratar'),
          construirBoton(Icons.wb_sunny_rounded, 'Protección'),
        ],
      ),
    );
  }
}

class SeccionTexto extends StatelessWidget {
  const SeccionTexto({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Text(
        'Esta rutina de cuidado facial está pensada para mantener la piel sana y luminosa durante el día. '
        'Primero se limpia el rostro con un limpiador suave, después se aplica un sérum o crema hidratante, '
        'y por último protector solar para proteger la piel de los rayos UV. '
        'El objetivo de esta pantalla es practicar la creación de layouts en Flutter '
        'utilizando diferentes widgets como Row, Column, Container y Padding.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class SeccionConsejos extends StatelessWidget {
  const SeccionConsejos({super.key});

  @override
  Widget build(BuildContext context) {
    final consejos = [
      'Usar agua tibia al lavar la cara',
      'Aplicar los productos de más ligero a más denso',
      'Nunca olvidar el protector solar',
    ];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFFFEEF5),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Consejos de skincare',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7A4E61),
              ),
            ),
            const SizedBox(height: 14),
            ...consejos.map(
              (consejo) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.favorite_border_rounded,
                      color: Color(0xFFE987B3),
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        consejo,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF6B5560),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}