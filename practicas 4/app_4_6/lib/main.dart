import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Rosita + Material 3
    const seed = Color(0xFFFF4DA6); // rosa chicle
    final scheme = ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Buttons Cute',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: scheme,
        scaffoldBackgroundColor: const Color(0xFFFFF1F6), // fondo rosa suuuper suave
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: scheme.primaryContainer,
          foregroundColor: scheme.onPrimaryContainer,
          elevation: 0,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: scheme.primary,
          contentTextStyle: const TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          behavior: SnackBarBehavior.floating,
        ),
      ),
      home: const ButtonsScreen(),
    );
  }
}

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    // Botones “píldora” anchos (como la demo) + cute
    final widePill = ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(330, 48)),
      shape: const WidgetStatePropertyAll(StadiumBorder()),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      elevation: const WidgetStatePropertyAll(1),
    );

    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => _showSnack(context, 'Back ✨'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: Column(
              children: [
                // Header “cute”
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: scheme.primaryContainer.withOpacity(0.55),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: scheme.primary.withOpacity(0.25)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.favorite_rounded),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Repertorio de botones Material',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // ====== ELEVATED ======
                _SectionTitle(title: 'Elevated'),
                ElevatedButton(
                  onPressed: null,
                  style: widePill,
                  child: const Text('ElevatedButton deshabilitado'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => _showSnack(context, 'ElevatedButton 💗'),
                  style: widePill,
                  child: const Text('ElevatedButton normal'),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () => _showSnack(context, 'ElevatedButton con ícono 💾'),
                  style: widePill,
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('ElevatedButton con ícono'),
                ),

                const SizedBox(height: 18),

                // ====== FILLED ======
                _SectionTitle(title: 'Filled'),
                FilledButton(
                  onPressed: null,
                  style: widePill,
                  child: const Text('FilledButton desabilitado'),
                ),
                const SizedBox(height: 10),
                FilledButton(
                  onPressed: () => _showSnack(context, 'FilledButton 🌸'),
                  style: widePill,
                  child: const Text('FilledButton normal'),
                ),
                const SizedBox(height: 10),
                FilledButton.icon(
                  onPressed: () => _showSnack(context, 'FilledButton con icono ✨'),
                  style: widePill,
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('FilledButton con icono'),
                ),

                const SizedBox(height: 18),

                // ====== FILLED TONAL ======
                _SectionTitle(title: 'Filled tonal'),
                FilledButton.tonal(
                  onPressed: () => _showSnack(context, 'FilledButton tonal 🍓'),
                  style: widePill,
                  child: const Text('FilledButton tonal'),
                ),
                const SizedBox(height: 10),
                FilledButton.tonalIcon(
                  onPressed: () => _showSnack(context, 'FilledButton tonal icon 🎀'),
                  style: widePill,
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('FilledButton tonal icon'),
                ),

                const SizedBox(height: 18),

                // ====== OUTLINED ======
                _SectionTitle(title: 'Outlined'),
                OutlinedButton(
                  onPressed: null,
                  style: widePill.copyWith(
                    side: WidgetStatePropertyAll(
                      BorderSide(color: scheme.primary.withOpacity(0.45), width: 1.4),
                    ),
                  ),
                  child: const Text('OutlinedButton deshabilitado'),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () => _showSnack(context, 'OutlinedButton 💞'),
                  style: widePill.copyWith(
                    side: WidgetStatePropertyAll(
                      BorderSide(color: scheme.primary.withOpacity(0.55), width: 1.4),
                    ),
                  ),
                  child: const Text('OutlinedButton normal'),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: () => _showSnack(context, 'OutlinedButton con ícono 🧸'),
                  style: widePill.copyWith(
                    side: WidgetStatePropertyAll(
                      BorderSide(color: scheme.primary.withOpacity(0.55), width: 1.4),
                    ),
                  ),
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('OutlinedButton con ícono'),
                ),

                const SizedBox(height: 18),

                // ====== TEXT ======
                _SectionTitle(title: 'Text'),
                TextButton(
                  onPressed: null,
                  child: const Text('TextButton deshabilitado'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => _showSnack(context, 'TextButton 🫶'),
                  child: const Text('TextButton normal'),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () => _showSnack(context, 'TextButton con ícono 🌷'),
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('TextButton con ícono'),
                ),

                const SizedBox(height: 22),
                Divider(color: scheme.primary.withOpacity(0.25)),
                const SizedBox(height: 12),

                // ====== BONUS: CARDS ======
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Bonus: Cards (galería) 🩷',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                const SizedBox(height: 12),

                GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _DemoCard(
                      title: 'Producto',
                      subtitle: 'Detalle breve del producto',
                      icon: Icons.shopping_bag_rounded,
                      onTap: () => _showSnack(context, 'Card: Producto 🛍️'),
                    ),
                    _DemoCard(
                      title: 'Perfil',
                      subtitle: 'Info del usuario / contacto',
                      icon: Icons.person_rounded,
                      onTap: () => _showSnack(context, 'Card: Perfil 👩‍💻'),
                    ),
                    _DemoCard(
                      title: 'Noticia',
                      subtitle: 'Titular y resumen corto',
                      icon: Icons.newspaper_rounded,
                      onTap: () => _showSnack(context, 'Card: Noticia 📰'),
                    ),
                    _DemoCard(
                      title: 'Galería',
                      subtitle: 'Abrir contenido multimedia',
                      icon: Icons.photo_library_rounded,
                      onTap: () => _showSnack(context, 'Card: Galería 📸'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: scheme.primary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DemoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _DemoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0.8,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // “Imagen” pastel sin assets, para que compile directo
            Container(
              height: 92,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: scheme.primaryContainer.withOpacity(0.55),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  shape: BoxShape.circle,
                  border: Border.all(color: scheme.primary.withOpacity(0.25)),
                ),
                child: Icon(icon, size: 34),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
              child: Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onTap,
                    child: const Text('VER'),
                  ),
                  const SizedBox(width: 4),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Acción en "$title" ✨')),
                      );
                    },
                    child: const Text('ACCION'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
