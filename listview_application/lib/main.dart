import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lista de maquillaje"),
          backgroundColor: Colors.pink,
        ),
        body: ListViewHomeLayout(),
      ),
    );
  }
}

// ---------------- LIST VIEW ----------------

class ListViewHomeLayout extends StatefulWidget {
  @override
  ListViewHome createState() {
    return ListViewHome();
  }
}

class ListViewHome extends State<ListViewHomeLayout> {

  List<String> titles = [
    "Base",
    "Corrector",
    "Rímel",
    "Barra de labios"
  ];

  List<String> subtitles = [
    "Base líquida clara",
    "Corrector ojeras",
    "Pestañas negras",
    "Color rojo"
  ];

  List<String> images = [
    "https://images.unsplash.com/photo-1596462502278-27bfdc403348",
    "https://images.unsplash.com/photo-1613088922623-6d8b0e8f6c44",
    "https://images.unsplash.com/photo-1586495777744-4413f21062fa",
    "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9"
  ];

  List<IconData> icons = [
    Icons.brush,
    Icons.face,
    Icons.remove_red_eye,
    Icons.favorite
  ];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {

        return Card(
          margin: EdgeInsets.all(8),
          child: ListTile(

            leading: CircleAvatar(
              backgroundImage: NetworkImage(images[index]),
            ),

            title: Text(titles[index]),

            subtitle: Text(subtitles[index]),

            trailing: Icon(icons[index]),

            onTap: () {

              setState(() {
                titles.add("Nuevo maquillaje");
                subtitles.add("Añadido al pulsar");
                images.add(images[0]); // repetimos imagen sin complicar
                icons.add(Icons.add);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(titles[index] + " pulsado"),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
