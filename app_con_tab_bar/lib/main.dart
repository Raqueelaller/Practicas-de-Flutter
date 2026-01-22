import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ---------------- APP PRINCIPAL ----------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4, // AHORA TENEMOS 4 TABS
        child: Scaffold(
          appBar: AppBar(
            title: const Text('App con TabBar'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Inicio'),
                Tab(icon: Icon(Icons.star), text: 'Favoritos'),
                Tab(icon: Icon(Icons.settings), text: 'Ajustes'),
                Tab(icon: Icon(Icons.info), text: 'Info'),
              ],
            ),
          ),

          // Cada tab se conecta con su widget
          body: const TabBarView(
            children: [
              MiContenidoInicio(),
              MiContenidoFavoritos(),
              MiContenidoAjustes(),
              MiContenidoInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////
//////////////// CONTENIDOS //////////////////////
//////////////////////////////////////////////////

// -------- TAB 1: INICIO --------

class MiContenidoInicio extends StatelessWidget {
  const MiContenidoInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.home, size: 80, color: Colors.blue),
          SizedBox(height: 10),
          Text(
            'Pantalla Inicio',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text('Bienvenido a la aplicación'),
        ],
      ),
    );
  }
}

// -------- TAB 2: FAVORITOS --------

class MiContenidoFavoritos extends StatelessWidget {
  const MiContenidoFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          leading: Icon(Icons.favorite, color: Colors.red),
          title: Text('Elemento favorito 1'),
        ),
        ListTile(
          leading: Icon(Icons.favorite, color: Colors.red),
          title: Text('Elemento favorito 2'),
        ),
        ListTile(
          leading: Icon(Icons.favorite, color: Colors.red),
          title: Text('Elemento favorito 3'),
        ),
      ],
    );
  }
}

// -------- TAB 3: AJUSTES --------

class MiContenidoAjustes extends StatelessWidget {
  const MiContenidoAjustes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SwitchListTile(
          title: const Text('Modo oscuro'),
          value: false,
          onChanged: (value) {},
        ),
        SwitchListTile(
          title: const Text('Notificaciones'),
          value: true,
          onChanged: (value) {},
        ),
      ],
    );
  }
}

// -------- TAB 4: INFO --------

class MiContenidoInfo extends StatelessWidget {
  const MiContenidoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.info, size: 70, color: Colors.green),
          SizedBox(height: 15),
          Text(
            'Información de la app',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Ejemplo de uso de TabBar y TabBarView '
            'con widgets separados para cada pestaña.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
