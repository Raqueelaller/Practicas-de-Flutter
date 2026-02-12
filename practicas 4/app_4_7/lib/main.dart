import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFFFF4DA6);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        scaffoldBackgroundColor: const Color(0xFFFFF1F6),
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: const CardsDemo(),
    );
  }
}

class CardsDemo extends StatelessWidget {
  const CardsDemo({super.key});

  void _msg(BuildContext context, String t) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        content: Text(t),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Card 1 (lo básico)',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: cs.primary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Hola, soy una card sencilla'),
            ),
          ),
          const SizedBox(height: 22),
          Text(
            'Card 2 (más contenido)',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: cs.primary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: cs.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite_rounded),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Título de la card',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Esto sería una descripción corta, tipo resumen.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22),
          Text(
            'Card 3 (imagen + botones)',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: cs.primary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 140,
                  color: cs.primaryContainer.withOpacity(0.8),
                  alignment: Alignment.center,
                  child: const Icon(Icons.photo_camera_rounded, size: 52),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 14, 16, 6),
                  child: Text(
                    'Card con “imagen”',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                  child: Text(
                    'Aquí iría un texto un poco más largo.',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => _msg(context, 'Ver 👀'),
                        child: const Text('VER'),
                      ),
                      const SizedBox(width: 6),
                      FilledButton(
                        onPressed: () => _msg(context, 'Guardar 💾'),
                        child: const Text('GUARDAR'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Text(
            'Card 4 (galería)',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: cs.primary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _MiniCard(
                title: 'Producto',
                icon: Icons.shopping_bag_rounded,
                onTap: () => _msg(context, 'Producto 🛍️'),
              ),
              _MiniCard(
                title: 'Perfil',
                icon: Icons.person_rounded,
                onTap: () => _msg(context, 'Perfil 👩‍💻'),
              ),
              _MiniCard(
                title: 'Noticia',
                icon: Icons.newspaper_rounded,
                onTap: () => _msg(context, 'Noticia 📰'),
              ),
              _MiniCard(
                title: 'Galería',
                icon: Icons.photo_library_rounded,
                onTap: () => _msg(context, 'Galería 📸'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _MiniCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      elevation: 0.9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 86,
              decoration: BoxDecoration(
                color: cs.primaryContainer.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              alignment: Alignment.center,
              child: Icon(icon, size: 34),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
