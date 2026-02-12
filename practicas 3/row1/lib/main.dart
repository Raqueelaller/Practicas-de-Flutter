
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
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white10),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: Scaffold(
          appBar: AppBar(
    title: const Text("Flutter Demo"),
  ),
        body: Row(
          children: <Widget>[
            // Content of my Row

            //Item 1/4
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.pinkAccent,
                child: const Text("Item 1"),
              ),
            ),

            //Item 2/4
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.deepOrange,
                child: const Text("Item 2"),
              ),
            ),

            //Item 3/4
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blueAccent,
                child: const Text("Item 3"),
              ),
            ),

            //Item 4/4
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