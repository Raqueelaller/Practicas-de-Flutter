import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const CuteAnimationsApp());
}

class CuteAnimationsApp extends StatelessWidget {
  const CuteAnimationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cute Animations',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFFDF7FB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE8AFCF),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
        ),
        sliderTheme: const SliderThemeData(
          activeTrackColor: Color(0xFFE8AFCF),
          thumbColor: Color(0xFFD98BB8),
        ),
        useMaterial3: true,
      ),
      home: const HomeAnimationsPage(),
    );
  }
}

class HomeAnimationsPage extends StatelessWidget {
  const HomeAnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _MenuItem(
        title: '1. AnimatedAlign',
        subtitle: 'Semillas estilo girasol',
        page: const SunflowerAlignPage(),
      ),
      _MenuItem(
        title: '2. AnimatedContainer',
        subtitle: 'Tarjetas de autocuidado',
        page: const SkincareContainerPage(),
      ),
      _MenuItem(
        title: '3. AnimatedOpacity',
        subtitle: 'Rutina glow',
        page: const GlowOpacityPage(),
      ),
      _MenuItem(
        title: '4. AnimatedScale',
        subtitle: 'Botones cute fitness',
        page: const FitnessScalePage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 7'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Práctica de animaciones Flutter',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cuatro pantallas, cuatro animaciones distintas, con un estilo visual simple y limpio.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    color: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      title: Text(
                        item.title,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(item.subtitle),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => item.page),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final String subtitle;
  final Widget page;

  _MenuItem({
    required this.title,
    required this.subtitle,
    required this.page,
  });
}

const int maxSeeds = 250;

class SunflowerAlignPage extends StatefulWidget {
  const SunflowerAlignPage({super.key});

  @override
  State<SunflowerAlignPage> createState() => _SunflowerAlignPageState();
}

class _SunflowerAlignPageState extends State<SunflowerAlignPage> {
  int seeds = maxSeeds ~/ 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedAlign'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Semillas animadas',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Las semillas cambian su posición suavemente.',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 10),
          Expanded(child: SunflowerWidget(seeds)),
          Text(
            'Mostrando $seeds semillas',
            style: const TextStyle(fontSize: 16),
          ),
          SizedBox(
            width: 300,
            child: Slider(
              min: 1,
              max: maxSeeds.toDouble(),
              value: seeds.toDouble(),
              onChanged: (val) {
                setState(() => seeds = val.round());
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class SunflowerWidget extends StatelessWidget {
  static const tau = math.pi * 2;
  static const scaleFactor = 1 / 40;
  static const size = 600.0;
  static final phi = (math.sqrt(5) + 1) / 2;
  static final rng = math.Random();

  final int seeds;

  const SunflowerWidget(this.seeds, {super.key});

  @override
  Widget build(BuildContext context) {
    final seedWidgets = <Widget>[];

    for (var i = 0; i < seeds; i++) {
      final theta = i * tau / phi;
      final r = math.sqrt(i) * scaleFactor;

      seedWidgets.add(
        AnimatedAlign(
          key: ValueKey(i),
          duration: Duration(milliseconds: rng.nextInt(500) + 250),
          curve: Curves.easeInOut,
          alignment: Alignment(r * math.cos(theta), -r * math.sin(theta)),
          child: const Dot(true),
        ),
      );
    }

    for (var j = seeds; j < maxSeeds; j++) {
      final x = math.cos(tau * j / (maxSeeds - 1)) * 0.9;
      final y = math.sin(tau * j / (maxSeeds - 1)) * 0.9;

      seedWidgets.add(
        AnimatedAlign(
          key: ValueKey(j),
          duration: Duration(milliseconds: rng.nextInt(500) + 250),
          curve: Curves.easeInOut,
          alignment: Alignment(x, y),
          child: const Dot(false),
        ),
      );
    }

    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(children: seedWidgets),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  static const size = 6.0;
  static const radius = 3.0;

  final bool lit;

  const Dot(this.lit, {super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: lit ? const Color(0xFFD98BB8) : const Color(0xFFEADDE6),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: const SizedBox(height: size, width: size),
    );
  }
}

class SkincareContainerPage extends StatefulWidget {
  const SkincareContainerPage({super.key});

  @override
  State<SkincareContainerPage> createState() => _SkincareContainerPageState();
}

class _SkincareContainerPageState extends State<SkincareContainerPage> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tarjeta de skincare',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Cambia tamaño, color y bordes.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut,
                width: expanded ? 300 : 180,
                height: expanded ? 220 : 120,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: expanded
                      ? const Color(0xFFF6D7E7)
                      : const Color(0xFFFCEEF5),
                  borderRadius: BorderRadius.circular(expanded ? 30 : 18),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 12,
                      offset: Offset(0, 4),
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.spa_rounded,
                      size: expanded ? 48 : 32,
                      color: const Color(0xFFB86A93),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      expanded ? 'Rutina completa' : 'Skincare',
                      style: TextStyle(
                        fontSize: expanded ? 22 : 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (expanded) ...[
                      const SizedBox(height: 10),
                      const Text(
                        'Limpieza, sérum, contorno y crema hidratante.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Pulsa la tarjeta para animarla'),
          ],
        ),
      ),
    );
  }
}

class GlowOpacityPage extends StatefulWidget {
  const GlowOpacityPage({super.key});

  @override
  State<GlowOpacityPage> createState() => _GlowOpacityPageState();
}

class _GlowOpacityPageState extends State<GlowOpacityPage> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedOpacity'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Rutina glow',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'La imagen aparece y desaparece suavemente.',
                style: TextStyle(color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                opacity: visible ? 1.0 : 0.15,
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9E3EF),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Icon(
                    Icons.favorite_rounded,
                    size: 90,
                    color: Color(0xFFD98BB8),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                child: Text(visible ? 'Ocultar glow' : 'Mostrar glow'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FitnessScalePage extends StatefulWidget {
  const FitnessScalePage({super.key});

  @override
  State<FitnessScalePage> createState() => _FitnessScalePageState();
}

class _FitnessScalePageState extends State<FitnessScalePage> {
  double scale = 1.0;

  void animateButton() {
    setState(() {
      scale = 1.2;
    });

    Future.delayed(const Duration(milliseconds: 180), () {
      if (mounted) {
        setState(() {
          scale = 1.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedScale'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cute fitness button',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'El botón aumenta y vuelve a su tamaño.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 30),
            AnimatedScale(
              scale: scale,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child: ElevatedButton.icon(
                onPressed: animateButton,
                icon: const Icon(Icons.fitness_center_rounded),
                label: const Text('Empezar rutina'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 18,
                  ),
                  backgroundColor: const Color(0xFFE8AFCF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}