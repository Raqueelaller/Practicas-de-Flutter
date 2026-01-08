import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ============================
// 1) MyApp: tema y Material 3
// ============================
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // (Práctica) constructor explícito

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // (Cambio) quitar la etiqueta DEBUG
      title: 'Práctica Flutter 1',
      theme: ThemeData(
        // (Cambio) activamos Material 3 para ver el estilo actual
        useMaterial3: true,

        // (Cambio) en vez de deepPurple, elegimos otro seed para personalizar la app
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const MyHomePage(title: 'Mi primera práctica Flutter'),
    );
  }
}

// ==========================================
// 2) MyHomePage: pasamos a experimentar UI
// ==========================================
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); // (Ya estaba)

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ======================================================
// 3) Estado: añadimos contador + bottom navigation state
// ======================================================
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // (Ya estaba) contador

  // (Nuevo) índice para la BottomNavigationBar
  int _currentIndex = 0;

  // (Ya estaba) incrementa contador
  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    // (Nuevo) feedback visual al pulsar el botón flotante
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Contador: $_counter')),
    );
  }

  @override
  Widget build(BuildContext context) {
    // (Nuevo) lista de “pantallas” simples para cada pestaña del BottomNavigationBar.
    // Importante: el contador se sigue mostrando en todas.
    final pages = <Widget>[
      _HomeBody(counter: _counter), // Inicio
      Center(child: Text('Buscar (contador: $_counter)')),
      Center(child: Text('Favoritos (contador: $_counter)')),
      Center(child: Text('Perfil (contador: $_counter)')),
    ];

    return Scaffold(
      // ==========================
      // APPBAR (Práctica)
      // ==========================
      // (Cambio) Para cambiar el alto (default ~56), envolvemos en PreferredSize
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // (Práctica) altura personalizada
        child: AppBar(
          // 1) Centrar el texto
          centerTitle: true,

          // 2) Poner el título en negrita
          title: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          // (Cambio) Color personalizado
          backgroundColor: Colors.teal.shade700,
          foregroundColor: Colors.white,

          // (Extra) añadimos acciones para “investigar” appBar actions
          actions: [
            IconButton(
              tooltip: 'Reset contador',
              icon: const Icon(Icons.restart_alt),
              onPressed: () => setState(() => _counter = 0),
            ),
          ],
        ),
      ),

      // ==========================
      // DRAWER (Práctica)
      // ==========================
      // (Cambio) añadimos Drawer para que salga el menú hamburguesa automático
      // (Cambio) modificamos el ancho por defecto con SizedBox
      drawer: SizedBox(
        width: 280, // (Práctica) ancho personalizado
        child: Drawer(
          backgroundColor: Colors.teal.shade50, // (Práctica) color del drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // (Práctica) Cabecera del drawer
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.teal.shade700),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Menú de navegación',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // 1) Añadimos ítems
              // 2) Iconos leading y trailing
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Inicio'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pop(context); // cerrar drawer
                  setState(() => _currentIndex = 0);
                },
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('Buscar'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _currentIndex = 1);
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favoritos'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _currentIndex = 2);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Ajustes'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),

      // ==========================
      // BODY (Práctica)
      // ==========================
      // (Cambio) body ahora cambia según bottom navigation
      body: pages[_currentIndex],

      // ==========================
      // FLOATING ACTION BUTTON (Práctica)
      // ==========================
      floatingActionButton: FloatingActionButton(
        // 1) Sigue funcionando el contador
        onPressed: _incrementCounter,

        // (Práctica) personalización estética
        backgroundColor: Colors.pink,
        tooltip: 'Incrementar contador',
        child: const Icon(Icons.add),

        // Nota: si quieres cambiar tamaño, hay variantes:
        // FloatingActionButton.small / .large / .extended(...)
      ),

      // 2) Cambiar la posición del FAB
      // Prueba otras: endTop, centerDocked, startFloat, etc.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // ==========================
      // BOTTOM NAVIGATION BAR (Práctica)
      // ==========================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),

        // 2) Con 4 o más ítems, Flutter cambia el comportamiento.
        // Solución: BottomNavigationBarType.fixed
        type: BottomNavigationBarType.fixed,

        // 3) Colores para estados (seleccionado / no seleccionado)
        selectedItemColor: Colors.teal.shade800,
        unselectedItemColor: Colors.grey,

        items: const [
          // 1) Añadimos iconos nuevos
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Fav'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

// =====================================================
// Widget separado para el BODY de “Inicio”
// (Así el código queda ordenado y más fácil de explicar)
// =====================================================
class _HomeBody extends StatelessWidget {
  final int counter;
  const _HomeBody({required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 2) Fondo degradado entre 2 tonos
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.teal.shade100, Colors.blue.shade100],
        ),
      ),

      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1) Imagen encima del texto (uso Image.network para no añadir assets)
            Image.network(
              'https://picsum.photos/240/120',
              width: 240,
              height: 120,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 16),

            const Text(
              'Has pulsado el botón:',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 8),

            // 3) Se sigue visualizando el número de pulsaciones del botón
            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // 1) Imagen debajo del texto
            Image.network(
              'https://picsum.photos/240/121',
              width: 240,
              height: 120,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
