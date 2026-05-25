import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialBeautyApp());
}

class MaterialBeautyApp extends StatelessWidget {
  const MaterialBeautyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro Beauty Material',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFEFA3C8),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF4FA),
      ),
      home: const BeautyClientFormPage(),
    );
  }
}

class BeautyClientFormPage extends StatefulWidget {
  const BeautyClientFormPage({super.key});

  @override
  State<BeautyClientFormPage> createState() => _BeautyClientFormPageState();
}

class _BeautyClientFormPageState extends State<BeautyClientFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController =
      TextEditingController(text: 'Raquel Aller');
  final TextEditingController _emailController =
      TextEditingController(text: 'raquel@email.com');
  final TextEditingController _edadController =
      TextEditingController(text: '26');
  final TextEditingController _observacionesController =
      TextEditingController(text: 'Prefiere tonos rosados y maquillaje natural.');

  String _provincia = 'Málaga';
  String _tipoServicio = 'Maquillaje';
  bool _aceptaPrivacidad = true;
  bool _clienteActiva = true;

  bool _mostrarResumen = false;

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _edadController.dispose();
    _observacionesController.dispose();
    super.dispose();
  }

  String? _validarNombre(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El nombre es obligatorio';
    }

    if (value.trim().length < 3) {
      return 'El nombre debe tener al menos 3 caracteres';
    }

    return null;
  }

  String? _validarEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El correo es obligatorio';
    }

    final RegExp emailRegex = RegExp(
      r'^[\w\.-]+@[\w\.-]+\.\w{2,}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Introduce un correo válido';
    }

    return null;
  }

  String? _validarEdad(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'La edad es obligatoria';
    }

    final int? edad = int.tryParse(value.trim());

    if (edad == null) {
      return 'La edad debe ser un número';
    }

    if (edad < 16 || edad > 90) {
      return 'La edad debe estar entre 16 y 90 años';
    }

    return null;
  }

  void _guardarRegistro() {
    if (!_aceptaPrivacidad) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          content: const Text(
            'Debes aceptar la política de privacidad para guardar el registro.',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      setState(() {
        _mostrarResumen = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFFEFA3C8),
          behavior: SnackBarBehavior.floating,
          content: const Text(
            'Registro beauty guardado correctamente ✨',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      );
    }
  }

  void _limpiarFormulario() {
    _formKey.currentState!.reset();

    _nombreController.clear();
    _emailController.clear();
    _edadController.clear();
    _observacionesController.clear();

    setState(() {
      _provincia = 'Málaga';
      _tipoServicio = 'Maquillaje';
      _aceptaPrivacidad = false;
      _clienteActiva = true;
      _mostrarResumen = false;
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

  Widget _radioServicio(String value) {
    return RadioListTile<String>(
      value: value,
      groupValue: _tipoServicio,
      activeColor: const Color(0xFFD96BA7),
      title: Text(
        value,
        style: const TextStyle(
          color: Color(0xFF7A4B61),
          fontWeight: FontWeight.w600,
        ),
      ),
      onChanged: (nuevoValor) {
        setState(() {
          _tipoServicio = nuevoValor!;
        });
      },
    );
  }

  Widget _resumenRegistro() {
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
        ),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            color: Color(0xFFD96BA7),
            size: 36,
          ),
          const SizedBox(height: 8),
          const Text(
            'Registro guardado',
            style: TextStyle(
              color: Color(0xFFC94F93),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _filaResumen(Icons.person_rounded, 'Nombre: ${_nombreController.text}'),
          _filaResumen(Icons.email_rounded, 'Email: ${_emailController.text}'),
          _filaResumen(Icons.cake_rounded, 'Edad: ${_edadController.text} años'),
          _filaResumen(Icons.location_on_rounded, 'Provincia: $_provincia'),
          _filaResumen(Icons.spa_rounded, 'Servicio favorito: $_tipoServicio'),
          _filaResumen(
            Icons.verified_rounded,
            _clienteActiva ? 'Cliente activa' : 'Cliente inactiva',
          ),
          _filaResumen(
            Icons.notes_rounded,
            'Observaciones: ${_observacionesController.text}',
          ),
        ],
      ),
    );
  }

  Widget _filaResumen(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFFD96BA7),
            size: 21,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
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
                            Icons.face_retouching_natural_rounded,
                            size: 48,
                            color: Color(0xFFD96BA7),
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Ficha de Clienta Beauty',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFC94F93),
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          'Formulario Material para crear o editar un registro de base de datos.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF9B6B83),
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 28),

                        TextFormField(
                          controller: _nombreController,
                          decoration: _decoracionCampo(
                            label: 'Nombre completo',
                            hint: 'Ej: Raquel Aller',
                            icon: Icons.person_rounded,
                          ),
                          textInputAction: TextInputAction.next,
                          validator: _validarNombre,
                        ),

                        const SizedBox(height: 18),

                        TextFormField(
                          controller: _emailController,
                          decoration: _decoracionCampo(
                            label: 'Correo electrónico',
                            hint: 'Ej: raquel@email.com',
                            icon: Icons.email_rounded,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: _validarEmail,
                        ),

                        const SizedBox(height: 18),

                        TextFormField(
                          controller: _edadController,
                          decoration: _decoracionCampo(
                            label: 'Edad',
                            hint: 'Entre 16 y 90',
                            icon: Icons.cake_rounded,
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: _validarEdad,
                        ),

                        const SizedBox(height: 18),

                        DropdownButtonFormField<String>(
                          value: _provincia,
                          decoration: _decoracionCampo(
                            label: 'Provincia andaluza',
                            hint: 'Selecciona una provincia',
                            icon: Icons.location_on_rounded,
                          ),
                          items: const [
                            DropdownMenuItem(value: 'Almería', child: Text('Almería')),
                            DropdownMenuItem(value: 'Cádiz', child: Text('Cádiz')),
                            DropdownMenuItem(value: 'Córdoba', child: Text('Córdoba')),
                            DropdownMenuItem(value: 'Granada', child: Text('Granada')),
                            DropdownMenuItem(value: 'Huelva', child: Text('Huelva')),
                            DropdownMenuItem(value: 'Jaén', child: Text('Jaén')),
                            DropdownMenuItem(value: 'Málaga', child: Text('Málaga')),
                            DropdownMenuItem(value: 'Sevilla', child: Text('Sevilla')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _provincia = value!;
                            });
                          },
                        ),

                        const SizedBox(height: 18),

                        TextFormField(
                          controller: _observacionesController,
                          decoration: _decoracionCampo(
                            label: 'Observaciones',
                            hint: 'Preferencias de belleza de la clienta',
                            icon: Icons.notes_rounded,
                          ),
                          maxLines: 3,
                        ),

                        const SizedBox(height: 22),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF0F7),
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: const Color(0xFFF3B6D4),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Servicio favorito',
                                style: TextStyle(
                                  color: Color(0xFFC94F93),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              _radioServicio('Maquillaje'),
                              _radioServicio('Skincare'),
                              _radioServicio('Masaje relajante'),
                            ],
                          ),
                        ),

                        const SizedBox(height: 14),

                        CheckboxListTile(
                          value: _aceptaPrivacidad,
                          activeColor: const Color(0xFFD96BA7),
                          title: const Text(
                            'Acepta la política de privacidad',
                            style: TextStyle(
                              color: Color(0xFF7A4B61),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: const Text(
                            'Necesario para guardar el registro',
                            style: TextStyle(
                              color: Color(0xFF9B6B83),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _aceptaPrivacidad = value ?? false;
                            });
                          },
                        ),

                        SwitchListTile(
                          value: _clienteActiva,
                          activeThumbColor: const Color(0xFFD96BA7),
                          activeTrackColor: const Color(0xFFFFC4DE),
                          title: const Text(
                            'Cliente activa',
                            style: TextStyle(
                              color: Color(0xFF7A4B61),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: const Text(
                            'Indica si el registro está activo en la base de datos',
                            style: TextStyle(
                              color: Color(0xFF9B6B83),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _clienteActiva = value;
                            });
                          },
                        ),

                        const SizedBox(height: 20),

                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: _guardarRegistro,
                                icon: const Icon(Icons.save_rounded),
                                label: const Text(
                                  'Guardar',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFEFA3C8),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFFC94F93),
                                  side: const BorderSide(
                                    color: Color(0xFFEFA3C8),
                                    width: 1.5,
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        _resumenRegistro(),
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