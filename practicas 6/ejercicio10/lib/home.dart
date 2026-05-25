import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'joke.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F7),
      appBar: AppBar(
        title: const Text('Riverpod Mood'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: SizedBox.expand(
        child: Consumer(
          builder: (context, ref, child) {
            final randomJoke = ref.watch(randomJokeProvider);

            return Stack(
              alignment: Alignment.center,
              children: [
                if (randomJoke.isRefreshing)
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: LinearProgressIndicator(),
                  ),
                SingleChildScrollView(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.pinkAccent,
                              Colors.purpleAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pinkAccent.withOpacity(0.30),
                              blurRadius: 18,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.auto_awesome_rounded,
                              color: Colors.white,
                              size: 62,
                            ),
                            SizedBox(height: 14),
                            Text(
                              'Chiste aleatorio',
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Pulsa el botón para descubrir uno nuevo.',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.4,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      Card(
                        elevation: 9,
                        shadowColor: Colors.pinkAccent.withOpacity(0.25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: switch (randomJoke) {
                              AsyncValue(:final value?) => Column(
                                  key: ValueKey(value.id),
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.format_quote_rounded,
                                      color: Colors.pinkAccent,
                                      size: 54,
                                    ),
                                    const SizedBox(height: 18),
                                    SelectableText(
                                      value.setup,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pinkAccent,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 18),
                                    SelectableText(
                                      value.punchline,
                                      style: const TextStyle(
                                        fontSize: 19,
                                        height: 1.45,
                                        color: Colors.black87,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              AsyncValue(error: != null) => const Column(
                                  key: ValueKey('error'),
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.error_outline_rounded,
                                      color: Colors.redAccent,
                                      size: 54,
                                    ),
                                    SizedBox(height: 18),
                                    Text(
                                      'No se ha podido cargar el chiste.',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              AsyncValue() => const Column(
                                  key: ValueKey('loading'),
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(height: 18),
                                    Text(
                                      'Cargando...',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      ElevatedButton.icon(
                        onPressed: () {
                          ref.invalidate(randomJokeProvider);
                        },
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text('Otro chiste'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 54),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}