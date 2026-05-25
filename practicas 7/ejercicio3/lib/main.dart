import 'package:flutter/material.dart';

void main() {
  runApp(const WellnessProfileApp());
}

class WellnessProfileApp extends StatelessWidget {
  const WellnessProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wellness Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFEFA3C8),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF4FA),
      ),
      home: const WellnessProfilePage(),
    );
  }
}

class WellnessProfilePage extends StatefulWidget {
  const WellnessProfilePage({super.key});

  @override
  State<WellnessProfilePage> createState() => _WellnessProfilePageState();
}

class _WellnessProfilePageState extends State<WellnessProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _objetivoController = TextEditingController();
  final TextEditingController _minutosController = TextEditingController();

  String _rutinaElegida = 'Skincare';
  bool _recordatorioDiario = true;

  String _resumenNombre = '';
  String _resumenObjetivo = '';
  String _resumenMinutos = '';
  String _resumenRutina = '';
  bool _mostrarResumen = false;

  @override
  void initState() {
    super.initState();

    _nombreController.addListener(() {
      debugPrint('Nombre actualizado: ${_nombreController.text}');
    });

    _objetivoController.addListener(() {
      debugPrint('Objetivo actualizado: ${_objetivoController.text}');
    });

    _minutosController.addListener(() {
      debugPrint('Minutos actualizados: ${_minutosController.text}');
    });
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _objetivoController.dispose();
    _minutosController.dispose();
    super.dispose();
  }

  String? _validarNombre(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Introduce tu nombre';
    }

    if (value.trim().length < 3) {
      return 'Debe tener al menos 3 caracteres';
    }

    return null;
  }

  String? _validarObjetivo(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Escribe tu objetivo de bienestar';
    }

    if (value.trim().length < 8) {
      return 'El objetivo debe ser un poquito más completo';
    }

    return null;
  }

  String? _validarMinutos(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Introduce los minutos diarios';
    }

    final int? minutos = int.tryParse(value.trim());

    if (minutos == null) {
      return 'Debe ser un número';
    }

    if (minutos < 5) {
      return 'Mínimo 5 minutos al día';
    }

    if (minutos > 180) {
      return 'Máximo 180 minutos al día';
    }

    return null;
  }

  void _guardarPerfil() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _resumenNombre = _nombreController.text.trim();
        _resumenObjetivo = _objetivoController.text.trim();
        _resumenMinutos = _minutosController.text.trim();
        _resumenRutina = _rutinaElegida;
        _mostrarResumen = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFFEFA3C8),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          content: const Text(
            'Perfil wellness guardado correctamente 🌸',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }

  void _limpiarFormulario() {
    _formKey.currentState!.reset();

    _nombreController.clear();
    _objetivoController.clear();
    _minutosController.clear();

    setState(() {
      _rutinaElegida = 'Skincare';
      _recordatorioDiario = true;
      _mostrarResumen = false;
      _resumenNombre = '';
      _resumenObjetivo = '';
      _resumenMinutos = '';
      _resumenRutina = '';
    });
  }

  InputDecoration _decoracionCampo({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(
        icon,
        color: const Color(0xFFD96BA7),
      ),
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(
        color: Color(0xFFD96BA7),
        fontWeight: FontWeight.w600,
      ),
      hintStyle: const TextStyle(
        color: Color(0xFFB48AA1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          color: Color(0xFFF3B6D4),
          width: 1.4,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          color: Color(0xFFD96BA7),
          width: 2.2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          color: Color(0xFFE57373),
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          color: Color(0xFFE57373),
          width: 2,
        ),
      ),
    );
  }

  Widget _crearResumen() {
    if (!_mostrarResumen) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0F7),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFF3B6D4),
          width: 1.4,
        ),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            color: Color(0xFFD96BA7),
            size: 34,
          ),
          const SizedBox(height: 8),
          const Text(
            'Resumen de tu perfil',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC94F93),
            ),
          ),
          const SizedBox(height: 14),
          _filaResumen(
            icon: Icons.person_rounded,
            texto: 'Nombre: $_resumenNombre',
          ),
          _filaResumen(
            icon: Icons.spa_rounded,
            texto: 'Rutina favorita: $_resumenRutina',
          ),
          _filaResumen(
            icon: Icons.timer_rounded,
            texto: 'Tiempo diario: $_resumenMinutos minutos',
          ),
          _filaResumen(
            icon: Icons.favorite_rounded,
            texto: 'Objetivo: $_resumenObjetivo',
          ),
          _filaResumen(
            icon: Icons.notifications_active_rounded,
            texto: _recordatorioDiario
                ? 'Recordatorio diario activado'
                : 'Recordatorio diario desactivado',
          ),
        ],
      ),
    );
  }

  Widget _filaResumen({
    required IconData icon,
    required String texto,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 21,
            color: const Color(0xFFD96BA7),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              texto,
              style: const TextStyle(
                color: Color(0xFF7A4B61),
                fontSize: 14.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String nombreActual = _nombreController.text.trim();

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFF4FA),
              Color(0xFFFFD7EA),
              Color(0xFFFFEEF7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(22),
              child: Card(
                elevation: 10,
                shadowColor: const Color(0xFFEFA3C8).withOpacity(0.35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: () {
                      setState(() {});
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE3F1),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFEFA3C8).withOpacity(0.4),
                                blurRadius: 16,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.self_improvement_rounded,
                            size: 48,
                            color: Color(0xFFD96BA7),
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Wellness Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFC94F93),
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          nombreActual.isEmpty
                              ? 'Crea tu rutina diaria de bienestar y belleza'
                              : 'Hola, $nombreActual 🌸 completa tu rutina',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF9B6B83),
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 28),

                        TextFormField(
                          controller: _nombreController,
                          decoration: _decoracionCampo(
                            label: 'Nombre',
                            hint: 'Ej: Raquel',
                            icon: Icons.person_rounded,
                          ),
                          textInputAction: TextInputAction.next,
                          validator: _validarNombre,
                        ),

                        const SizedBox(height: 18),

                        DropdownButtonFormField<String>(
                          value: _rutinaElegida,
                          decoration: _decoracionCampo(
                            label: 'Rutina favorita',
                            hint: 'Elige una rutina',
                            icon: Icons.spa_rounded,
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'Skincare',
                              child: Text('Skincare'),
                            ),
                            DropdownMenuItem(
                              value: 'Maquillaje natural',
                              child: Text('Maquillaje natural'),
                            ),
                            DropdownMenuItem(
                              value: 'Yoga suave',
                              child: Text('Yoga suave'),
                            ),
                            DropdownMenuItem(
                              value: 'Meditación',
                              child: Text('Meditación'),
                            ),
                            DropdownMenuItem(
                              value: 'Paseo saludable',
                              child: Text('Paseo saludable'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _rutinaElegida = value!;
                            });
                          },
                        ),

                        const SizedBox(height: 18),

                        TextFormField(
                          controller: _minutosController,
                          decoration: _decoracionCampo(
                            label: 'Minutos al día',
                            hint: 'Ej: 20',
                            icon: Icons.timer_rounded,
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: _validarMinutos,
                        ),

                        const SizedBox(height: 18),

                        TextFormField(
                          controller: _objetivoController,
                          decoration: _decoracionCampo(
                            label: 'Objetivo personal',
                            hint: 'Ej: Cuidar mi piel cada noche',
                            icon: Icons.favorite_rounded,
                          ),
                          maxLines: 3,
                          textInputAction: TextInputAction.done,
                          validator: _validarObjetivo,
                        ),

                        const SizedBox(height: 16),

                        SwitchListTile(
                          value: _recordatorioDiario,
                          activeThumbColor: const Color(0xFFD96BA7),
                          activeTrackColor: const Color(0xFFFFC4DE),
                          title: const Text(
                            'Recordatorio diario',
                            style: TextStyle(
                              color: Color(0xFFC94F93),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Recibir aviso para no olvidar mi rutina',
                            style: TextStyle(
                              color: Color(0xFF9B6B83),
                            ),
                          ),
                          secondary: const Icon(
                            Icons.notifications_active_rounded,
                            color: Color(0xFFD96BA7),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _recordatorioDiario = value;
                            });
                          },
                        ),

                        const SizedBox(height: 20),

                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: _guardarPerfil,
                                icon: const Icon(Icons.save_rounded),
                                label: const Text(
                                  'Guardar',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFEFA3C8),
                                  foregroundColor: Colors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: _limpiarFormulario,
                                icon: const Icon(Icons.cleaning_services_rounded),
                                label: const Text(
                                  'Limpiar',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFFC94F93),
                                  side: const BorderSide(
                                    color: Color(0xFFEFA3C8),
                                    width: 1.6,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        _crearResumen(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}