import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo row1 Raquel',
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: const Color.fromARGB(255, 255, 155, 188)),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: Scaffold(
          appBar: AppBar(
    title: const Text("Flutter Demo"),
  ),
        body: Column(
          children: <Widget>[
            // Content of my Row

            //Item 1/4
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.pinkAccent,
                child: const Text("Hola"),
              ),
            ),

            //Item 2/4
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.deepOrange,
                child: const Text("Como "),
              ),
            ),

            //Item 3/4
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blueAccent,
                child: const Text("estás"),
              ),
            ),

            //Item 4/4
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
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Inicio',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Perfil',
      ),
    ],
  ),
      ),
    );
  }
}