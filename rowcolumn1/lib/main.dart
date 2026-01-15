
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
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white10),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: SafeArea(
          child: Scaffold(
              body: Column(children: <Widget>[
        parchisWitget(context),
      ]))),
    );
  }

  Widget parchisWitget(BuildContext context) {
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
                      Text("Paleta sombra de ojos:",
                          style: TextStyle(
                              fontSize: size01, fontWeight: FontWeight.bold)),
                    ]))), // Text Top

        Expanded(
            child: Row(children: <Widget>[
          Expanded(
              child: Container(
                  color: Colors.brown,
                  child: const Center(
                      child: Text("Marrón",
                          style: TextStyle(fontSize: size02))))),
          Expanded(
              child: Container(
                  color: const Color.fromARGB(255, 247, 97, 43),
                  child: const Center(
                      child: Text("Caqui",
                          style: TextStyle(fontSize: size02))))),
        ])), //Row 1/2

        Expanded(
            child: Row(children: <Widget>[
          Expanded(
              child: Container(
                  color: const Color(0xFFD8B5A5),
                  child: const Center(
                      child: Text("Nude",
                          style: TextStyle(fontSize: size02))))),
          Expanded(
              child: Container(
                  color: const Color(0xFFE8A2B8),
                  child: const Center(
                      child: Text("Rosa",
                          style: TextStyle(fontSize: size02))))),
        ])), //Row 2/2
        Expanded(
            child: Container(
                color: const Color.fromARGB(255, 243, 14, 87),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text("REVOLUTION",
                          style: TextStyle(
                              fontSize: size01, fontWeight: FontWeight.bold))
                    ]))), // Text Bottom
      ],
    ));
  }
}