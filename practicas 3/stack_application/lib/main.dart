import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stack y Positioned'),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Stack(
              clipBehavior: Clip.none, // para que pueda salirse sin cortar
              children: [
                // Fondo
                Container(
                  color: Colors.red.withOpacity(0.7),
                ),

                // Cuadrado 1 (con sombra y bordes redondeados)
                Positioned(
                  top: 40,
                  left: 40,
                  child: Opacity(
                    opacity: 0.75,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(5, 5),
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Cuadrado 2 (con transformación: girado un poco)
                Positioned(
                  top: 90,
                  left: 90,
                  child: Transform.rotate(
                    angle: 0.15, // un poquito girado
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.purple.withOpacity(0.6),
                    ),
                  ),
                ),

                // Texto encima (para ver que está apilado)
                const Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    "Probando Stack",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
