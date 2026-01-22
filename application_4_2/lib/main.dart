import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AppNavegacionRichText());

class AppNavegacionRichText extends StatelessWidget {
  const AppNavegacionRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Inicio(),
    );
  }
}

// ----------- HOME (4 botones) -----------
class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inicio")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Pantalla1RichText()),
              ),
              child: const Text("Pantalla 1 (RichText #/@)"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Pantalla2Precio()),
              ),
              child: const Text("Pantalla 2 (RichText precio)"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Pantalla3Normal()),
              ),
              child: const Text("Pantalla 3 (normal)"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Pantalla4Normal()),
              ),
              child: const Text("Pantalla 4 (normal)"),
            ),
          ],
        ),
      ),
    );
  }
}

// ----------- PANTALLA 1: #hashtag y @mention clicables -----------
class Pantalla1RichText extends StatefulWidget {
  const Pantalla1RichText({super.key});

  @override
  State<Pantalla1RichText> createState() => _Pantalla1RichTextState();
}

class _Pantalla1RichTextState extends State<Pantalla1RichText> {
  late TapGestureRecognizer _tagRec;
  late TapGestureRecognizer _mentionRec;
  String mensaje = "Nada pulsado todavía";

  @override
  void initState() {
    super.initState();
    _tagRec = TapGestureRecognizer()
      ..onTap = () => setState(() => mensaje = "Pulsaste #revolution");
    _mentionRec = TapGestureRecognizer()
      ..onTap = () => setState(() => mensaje = "Pulsaste @facturac");
  }

  @override
  void dispose() {
    _tagRec.dispose();
    _mentionRec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pantalla 1")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(mensaje),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 18),
                children: [
                  const TextSpan(text: "Hoy probamos "),
                  TextSpan(
                    text: "#revolution ",
                    style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    recognizer: _tagRec,
                  ),
                  const TextSpan(text: "con "),
                  TextSpan(
                    text: "Raquel",
                    style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                    recognizer: _mentionRec,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Volver"),
            ),
          ],
        ),
      ),
    );
  }
}

// ----------- PANTALLA 2: precio tachado + precio rebajado -----------
class Pantalla2Precio extends StatelessWidget {
  const Pantalla2Precio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pantalla 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 22),
                children: [
                  TextSpan(text: "Labial: "),
                  TextSpan(
                    text: "9,99€ ",
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  TextSpan(
                    text: "5,99€",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Volver"),
            ),
          ],
        ),
      ),
    );
  }
}

// ----------- PANTALLA 3 (normal) -----------
class Pantalla3Normal extends StatelessWidget {
  const Pantalla3Normal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pantalla 3")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Volver"),
        ),
      ),
    );
  }
}

// ----------- PANTALLA 4 (normal) -----------
class Pantalla4Normal extends StatelessWidget {
  const Pantalla4Normal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pantalla 4")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Volver"),
        ),
      ),
    );
  }
}
