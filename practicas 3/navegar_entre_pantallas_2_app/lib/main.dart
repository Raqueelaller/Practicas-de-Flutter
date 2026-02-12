import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}

// ------------------ INICIO con GridView ------------------
class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio (GridView)')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2, // 2 columnas
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _gridItem(
              context: context,
              title: "Ejercicio 4",
              subtitle: "Column",
              icon: Icons.view_column,
              color: Colors.pinkAccent,
              page: Ejercicio4(),
            ),
            _gridItem(
              context: context,
              title: "Ejercicio 5",
              subtitle: "Row",
              icon: Icons.view_week,
              color: Colors.deepOrange,
              page: Ejercicio5(),
            ),
            _gridItem(
              context: context,
              title: "Ejercicio 6",
              subtitle: "Paleta",
              icon: Icons.palette,
              color: Colors.purple,
              page: Ejercicio6(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gridItem({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Widget page,
  }) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.85),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------ EJERCICIO 4 (COLUMN) ------------------
class Ejercicio4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejercicio 4 - Column')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.pinkAccent,
              child: const Text("Hola"),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.deepOrange,
              child: const Text("Como"),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueAccent,
              child: const Text("estás"),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.green,
              child: const Text("?"),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------ EJERCICIO 5 (ROW) ------------------
class Ejercicio5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejercicio 5 - Row')),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.pinkAccent,
              child: const Text("Item 1"),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.deepOrange,
              child: const Text("Item 2"),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueAccent,
              child: const Text("Item 3"),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.green,
              child: const Text("Item 4"),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------ EJERCICIO 6 (PALETA) ------------------
class Ejercicio6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double size01 = 20.0;
    const double size02 = 25.0;

    return Scaffold(
      appBar: AppBar(title: Text('Ejercicio 6 - Paleta')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 243, 14, 87),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Paleta sombra de ojos:",
                    style: TextStyle(fontSize: size01, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.brown,
                    child: const Center(
                      child: Text("Marrón", style: TextStyle(fontSize: size02)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 247, 97, 43),
                    child: const Center(
                      child: Text("Caqui", style: TextStyle(fontSize: size02)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: const Color(0xFFD8B5A5),
                    child: const Center(
                      child: Text("Nude", style: TextStyle(fontSize: size02)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: const Color(0xFFE8A2B8),
                    child: const Center(
                      child: Text("Rosa", style: TextStyle(fontSize: size02)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 243, 14, 87),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "REVOLUTION",
                    style: TextStyle(fontSize: size01, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
