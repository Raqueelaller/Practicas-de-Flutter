import 'package:flutter/material.dart';
import 'package:proyecto_app_4_2/pages/home_get.dart';


void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFFE91E63);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Cute',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        scaffoldBackgroundColor: const Color(0xFFFFF1F6),
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: const HomePage(),
    );
  }
}
