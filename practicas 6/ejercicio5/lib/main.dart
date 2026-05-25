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
            const Text(
              'Pantalla táctil',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
              textAlign: TextAlign.center,
            ),
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
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/swipe');
              },
              icon: const Icon(Icons.swipe_rounded),
              label: const Text('Ir a Swipe'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 54),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
            const Text(
              'Pantalla con deslizamiento',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
              textAlign: TextAlign.center,
            ),
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
                      Icons.touch_app_rounded,
                      color: Colors.pinkAccent,
                      size: 30,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'GestureDetector permite detectar gestos como tap, doble tap, pulsación larga o desplazamiento.',
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
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: const Icon(Icons.touch_app_rounded),
              label: const Text('Ir a Tap'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 54),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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