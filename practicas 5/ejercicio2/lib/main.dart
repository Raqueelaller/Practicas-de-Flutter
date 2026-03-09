import 'package:flutter/material.dart';

void main() {
  runApp(const GlowFitApp());
}

class GlowFitApp extends StatefulWidget {
  const GlowFitApp({super.key});

  @override
  State<GlowFitApp> createState() => _GlowFitAppState();
}

class _GlowFitAppState extends State<GlowFitApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _cambiarTema(bool oscuro) {
    setState(() {
      _themeMode = oscuro ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlowFit',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFEF7DA0),
          onPrimary: Colors.white,
          secondary: Color(0xFFF6B6C9),
          onSecondary: Colors.black87,
          surface: Color(0xFFFFF7FA),
          onSurface: Colors.black87,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF7FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFD9E6),
          foregroundColor: Colors.black87,
          centerTitle: true,
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFFFFEAF1),
          elevation: 3,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFFA8C5),
          onPrimary: Colors.black,
          secondary: Color(0xFFB88AA0),
          onSecondary: Colors.white,
          surface: Color(0xFF1E1A1D),
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFF161214),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2A1F25),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFF2B2227),
          elevation: 3,
        ),
      ),
      home: HomePage(
        themeMode: _themeMode,
        onThemeChanged: _cambiarTema,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final ThemeMode themeMode;
  final ValueChanged<bool> onThemeChanged;

  const HomePage({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final bool esOscuro = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('GlowFit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              Icons.favorite,
              size: 80,
              color: colors.primary,
            ),
            const SizedBox(height: 20),
            Text(
              'Rutina wellness diaria',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text(
              'Esta app permite cambiar entre modo claro y oscuro usando Material Themes.',
              textAlign: TextAlign.center,
              style: TextStyle(color: colors.onSurface),
            ),
            const SizedBox(height: 24),
            SwitchListTile(
              title: Text(
                esOscuro ? 'Modo oscuro activado' : 'Modo claro activado',
              ),
              secondary: Icon(
                esOscuro ? Icons.dark_mode : Icons.light_mode,
                color: colors.primary,
              ),
              value: esOscuro,
              onChanged: onThemeChanged,
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: Icon(Icons.spa, color: colors.primary),
                title: const Text('Skincare de mañana'),
                subtitle: const Text('Limpieza, sérum y protector solar'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.fitness_center, color: colors.primary),
                title: const Text('Entrenamiento suave'),
                subtitle: const Text('30 min de ejercicio funcional'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.local_drink, color: colors.primary),
                title: const Text('Hidratación'),
                subtitle: const Text('Beber 2 litros de agua al día'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}