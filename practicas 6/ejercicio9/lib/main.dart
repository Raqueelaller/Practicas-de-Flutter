import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TareasProvider(),
      child: const MyApp(),
    ),
  );
}

class Tarea {
  final String titulo;
  bool completada;
  String prioridad;

  Tarea(
    this.titulo, {
    this.completada = false,
    this.prioridad = 'Baja',
  });
}

class TareasProvider with ChangeNotifier {
  final List<Tarea> _tareas = [];

  List<Tarea> get tareas => _tareas;

  void agregarTarea(String titulo) {
    _tareas.add(
      Tarea(
        titulo,
        prioridad: 'Baja',
      ),
    );
    notifyListeners();
  }

  void cambiarEstadoTarea(int index) {
    _tareas[index].completada = !_tareas[index].completada;
    notifyListeners();
  }

  void eliminarTarea(int index) {
    _tareas.removeAt(index);
    notifyListeners();
  }

  void cambiarPrioridad(int index) {
    if (_tareas[index].prioridad == 'Baja') {
      _tareas[index].prioridad = 'Media';
    } else if (_tareas[index].prioridad == 'Media') {
      _tareas[index].prioridad = 'Alta';
    } else {
      _tareas[index].prioridad = 'Baja';
    }

    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de tareas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pinkAccent,
      ),
      home: const TareasScreen(),
    );
  }
}

class TareasScreen extends StatefulWidget {
  const TareasScreen({super.key});

  @override
  State<TareasScreen> createState() => _TareasScreenState();
}

class _TareasScreenState extends State<TareasScreen> {
  final TextEditingController _controller = TextEditingController();

  void _agregarTarea(BuildContext context) {
    final texto = _controller.text.trim();

    if (texto.isNotEmpty) {
      context.read<TareasProvider>().agregarTarea(texto);
      _controller.clear();
      FocusScope.of(context).unfocus();
    }
  }

  Color _colorPrioridad(String prioridad) {
    if (prioridad == 'Alta') {
      return Colors.redAccent;
    }

    if (prioridad == 'Media') {
      return Colors.orangeAccent;
    }

    return Colors.green;
  }

  IconData _iconoPrioridad(String prioridad) {
    if (prioridad == 'Alta') {
      return Icons.priority_high_rounded;
    }

    if (prioridad == 'Media') {
      return Icons.star_half_rounded;
    }

    return Icons.spa_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F7),
      appBar: AppBar(
        title: const Text('Lista de tareas'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(18),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.pinkAccent,
                    Colors.purpleAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(26),
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
                    Icons.check_circle_rounded,
                    size: 64,
                    color: Colors.white,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Mis tareas bonitas',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Organiza tu día con calma, prioridades y un poquito de brillo.',
                    style: TextStyle(
                      fontSize: 15.5,
                      height: 1.4,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Nueva tarea',
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.edit_note_rounded,
                          color: Colors.pinkAccent,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onSubmitted: (_) => _agregarTarea(context),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Material(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(18),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () => _agregarTarea(context),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: Consumer<TareasProvider>(
                builder: (context, tareasProvider, child) {
                  if (tareasProvider.tareas.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(28),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.favorite_border_rounded,
                              size: 80,
                              color: Colors.pinkAccent,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Todavía no hay tareas',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Añade la primera tarea para empezar a organizar tu día.',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.4,
                                color: Colors.black54,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(18, 4, 18, 18),
                    itemCount: tareasProvider.tareas.length,
                    itemBuilder: (context, index) {
                      final tarea = tareasProvider.tareas[index];
                      final colorPrioridad = _colorPrioridad(tarea.prioridad);

                      return Card(
                        elevation: 7,
                        shadowColor: Colors.pinkAccent.withOpacity(0.18),
                        margin: const EdgeInsets.only(bottom: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: tarea.completada,
                                activeColor: Colors.pinkAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                onChanged: (_) {
                                  context
                                      .read<TareasProvider>()
                                      .cambiarEstadoTarea(index);
                                },
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tarea.titulo,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: tarea.completada
                                            ? Colors.black38
                                            : Colors.black87,
                                        decoration: tarea.completada
                                            ? TextDecoration.lineThrough
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        context
                                            .read<TareasProvider>()
                                            .cambiarPrioridad(index);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: colorPrioridad.withOpacity(0.14),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            color: colorPrioridad,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              _iconoPrioridad(tarea.prioridad),
                                              size: 17,
                                              color: colorPrioridad,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              'Prioridad ${tarea.prioridad}',
                                              style: TextStyle(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.bold,
                                                color: colorPrioridad,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<TareasProvider>()
                                      .eliminarTarea(index);
                                },
                                icon: const Icon(
                                  Icons.delete_rounded,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}