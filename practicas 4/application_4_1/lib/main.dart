import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AppRowRichText());

class AppRowRichText extends StatelessWidget {
  const AppRowRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeRow(),
    );
  }
}

class HomeRow extends StatefulWidget {
  const HomeRow({super.key});

  @override
  State<HomeRow> createState() => _HomeRowState();
}

class _HomeRowState extends State<HomeRow> {
  late TapGestureRecognizer _tagRec;
  late TapGestureRecognizer _mentionRec;

  String mensaje = "Pulsa un hashtag o una mención";

  @override
  void initState() {
    super.initState();
    _tagRec = TapGestureRecognizer()
      ..onTap = () {
        setState(() => mensaje = "Has pulsado #makeup");
      };

    _mentionRec = TapGestureRecognizer()
      ..onTap = () {
        setState(() => mensaje = "Has pulsado @raquel");
      };
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
      appBar: AppBar(
        title: const Text("RichText (Row)"),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(mensaje),
            const SizedBox(height: 12),

            // Row con 2 ejemplos
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black, fontSize: 16),
                          children: [
                            const TextSpan(text: "Probando "),
                            TextSpan(
                              text: "#makeup ",
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: _tagRec,
                            ),
                            const TextSpan(text: "con "),
                            TextSpan(
                              text: "@raquel",
                              style: const TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: _mentionRec,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(text: "Paleta sombras\n"),
                            TextSpan(
                              text: "12,99€  ",
                              style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(
                              text: "7,99€",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
