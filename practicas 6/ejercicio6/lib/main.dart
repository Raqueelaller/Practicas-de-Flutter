import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pinkAccent,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TapScreen(),
        '/swipe': (context) => const SwipeScreen(),
      },
    );
  }
}

class TapScreen extends StatefulWidget {
  const TapScreen({super.key});

  @override
  State<TapScreen> createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  String mensaje = 'Toca la tarjeta';
  IconData icono = Icons.touch_app_rounded;

  void cambiarMensaje() {
    setState(() {
      mensaje = '¡Has tocado la tarjeta!';
      icono = Icons.favorite_rounded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F7),
      appBar: AppBar(
        title: const Text('GestureDetector Tap'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const GradientTitle(texto: 'Pantalla táctil'),
            const SizedBox(height: 8),
            const Text(
              'Pulsa sobre la tarjeta para cambiar su contenido.',
              style: TextStyle(
                fontSize: 16.5,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 34),
            GestureDetector(
              onTap: cambiarMensaje,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                width: double.infinity,
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.35),
                      blurRadius: 18,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icono,
                      size: 80,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 18),
                    Text(
                      mensaje,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Tap Me!',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Card(
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
                      Icons.waves_rounded,
                      color: Colors.pinkAccent,
                      size: 30,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'InkWell produce un efecto de ondulación cuando se pulsa sobre un elemento Material.',
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
            ),
            const SizedBox(height: 26),
            InkWellNavigationButton(
              texto: 'Cambia de página',
              icono: Icons.swipe_rounded,
              onTap: () {
                debugPrint('InkWell tocado');
                Navigator.pushNamed(context, '/swipe');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  Color backgroundColor = Colors.pinkAccent;
  String texto = 'Desliza la tarjeta';
  IconData icono = Icons.swipe_rounded;

  void cambiarColorAlDeslizar(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        backgroundColor = Colors.green;
        texto = 'Deslizaste a la derecha';
        icono = Icons.arrow_forward_rounded;
      });
    } else if (details.delta.dx < 0) {
      setState(() {
        backgroundColor = Colors.redAccent;
        texto = 'Deslizaste a la izquierda';
        icono = Icons.arrow_back_rounded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F7),
      appBar: AppBar(
        title: const Text('GestureDetector Swipe'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const GradientTitle(texto: 'Pantalla con deslizamiento'),
            const SizedBox(height: 8),
            const Text(
              'Desliza la tarjeta hacia la derecha o hacia la izquierda.',
              style: TextStyle(
                fontSize: 16.5,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 34),
            GestureDetector(
              onHorizontalDragUpdate: cambiarColorAlDeslizar,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                width: double.infinity,
                height: 260,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: backgroundColor.withOpacity(0.35),
                      blurRadius: 18,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icono,
                      size: 80,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 18),
                    Text(
                      texto,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Swipe me!',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Card(
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
                      Icons.auto_awesome_rounded,
                      color: Colors.pinkAccent,
                      size: 30,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'ShaderMask permite aplicar degradados en textos para conseguir un efecto visual más llamativo.',
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
            ),
            const SizedBox(height: 26),
            InkWellNavigationButton(
              texto: 'Cambia de página',
              icono: Icons.touch_app_rounded,
              onTap: () {
                debugPrint('InkWell tocado');
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InkWellNavigationButton extends StatelessWidget {
  final String texto;
  final IconData icono;
  final VoidCallback onTap;

  const InkWellNavigationButton({
    super.key,
    required this.texto,
    required this.icono,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.pinkAccent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white.withOpacity(0.35),
        highlightColor: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icono,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Text(
                texto,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientTitle extends StatelessWidget {
  final String texto;

  const GradientTitle({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            Colors.pinkAccent,
            Colors.purpleAccent,
            Colors.orangeAccent,
          ],
        ).createShader(bounds);
      },
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 29,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}