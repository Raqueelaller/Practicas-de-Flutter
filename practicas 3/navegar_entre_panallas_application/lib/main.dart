import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ------------------ RUTAS ------------------
class PageRoutes {
  static const String ej4 = '/ej4';
  static const String ej5 = '/ej5';
  static const String ej6 = '/ej6';
}

// ------------------ APP ------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicios 4-5-6',
      initialRoute: PageRoutes.ej4,
      routes: {
        PageRoutes.ej4: (context) => const Ejercicio4Screen(),
        PageRoutes.ej5: (context) => const Ejercicio5Screen(),
        PageRoutes.ej6: (context) => const Ejercicio6Screen(),
      },
    );
  }
}

// ------------------ DRAWER ------------------
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createDrawerHeader(),
          _createDrawerBodyItem(
            context: context,
            icon: Icons.view_column,
            text: 'Ejercicio 4 (Column)',
            route: PageRoutes.ej4,
          ),
          _createDrawerBodyItem(
            context: context,
            icon: Icons.view_week,
            text: 'Ejercicio 5 (Row)',
            route: PageRoutes.ej5,
          ),
          _createDrawerBodyItem(
            context: context,
            icon: Icons.palette,
            text: 'Ejercicio 6 (Paleta)',
            route: PageRoutes.ej6,
          ),
          const Divider(),
          const ListTile(
            title: Text('App version 1.0.0'),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.pink,
      ),
      child: const Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          'Menú ejercicios',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }

  Widget _createDrawerBodyItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required String route,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        Navigator.pop(context); // cierra el drawer
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }
}

// ------------------ EJERCICIO 4 (COLUMN) ------------------
class Ejercicio4Screen extends StatelessWidget {
  const Ejercicio4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text("Ejercicio 4 - Column"),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 155, 188),
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
      bottomNavigationBar: BottomNavigationBar(

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

// ------------------ EJERCICIO 5 (ROW) ------------------
class Ejercicio5Screen extends StatelessWidget {
  const Ejercicio5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text("Ejercicio 5 - Row"),
        backgroundColor: Colors.pinkAccent,
      ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

// ------------------ EJERCICIO 6 (PALETA) ------------------
class Ejercicio6Screen extends StatelessWidget {
  const Ejercicio6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text("Ejercicio 6 - Paleta"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _paletaWidget(),
          ],
        ),
      ),
    );
  }

  Widget _paletaWidget() {
    const double size01 = 20.0;
    const double size02 = 25.0;

    return Expanded(
      child: Column(
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
                    color: Color.fromARGB(255, 247, 97, 43),
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
                    color: Color(0xFFD8B5A5),
                    child: const Center(
                      child: Text("Nude", style: TextStyle(fontSize: size02)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color(0xFFE8A2B8),
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
