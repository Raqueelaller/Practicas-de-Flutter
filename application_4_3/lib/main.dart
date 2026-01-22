import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imagenes + SVG',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería simple'),
        // Icono Material (procedencia 1)
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.photo),
          ),
        ],
      ),

      // BODY: columna con 3 imágenes
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '3 imágenes (bitmap + svg + bitmap)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // 1) Bitmap local
            Image.asset(
              'assets/images/descarga.jpg',
              height: 130,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 12),

            // 2) SVG local
            SvgPicture.asset(
              'assets/svg/polaroid.svg',
              height: 90,
              placeholderBuilder: (context) => const Text('Cargando SVG...'),
            ),

            const SizedBox(height: 12),

            // 3) Bitmap por URL (para variar)
            Image.network(
              'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
              height: 130,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),

      // BottomNavigationBar con iconos de 2 procedencias
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          // FontAwesome (procedencia 2)
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cameraRetro),
            label: 'Fotos',
          ),
          // Material
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Likes',
          ),
        ],
      ),
    );
  }
}
