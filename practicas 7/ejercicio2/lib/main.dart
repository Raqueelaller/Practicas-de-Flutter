import 'package:flutter/material.dart';

void main() {
  runApp(const BeautyRegisterApp());
}

class BeautyRegisterApp extends StatelessWidget {
  const BeautyRegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beauty Register',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFEFA3C8),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF4FA),
      ),
      home: const BeautyRegisterPage(),
    );
  }
}

class BeautyRegisterPage extends StatefulWidget {
  const BeautyRegisterPage({super.key});

  @override
  State<BeautyRegisterPage> createState() => _BeautyRegisterPageState();
}

class _BeautyRegisterPageState extends State<BeautyRegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _ocultarPassword = true;
  String _tipoPiel = 'Normal';

  String? _validarNombre(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Introduce tu nombre beauty';
    }

    if (value.trim().length < 3) {
      return 'El nombre debe tener al menos 3 letras';
    }

    return null;
  }

  String? _validarEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Introduce tu email';
    }

    final RegExp emailRegex = RegExp(
      r'^[\w\.-]+@[\w\.-]+\.\w{2,}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Introduce un email válido';
    }

    return null;
  }

  String? _validarTelefono(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Introduce tu teléfono';
    }

    final RegExp telefonoRegex = RegExp(r'^[0-9]{9}$');

    if (!telefonoRegex.hasMatch(value.trim())) {
      return 'El teléfono debe tener 9 números';
    }

    return null;
  }

  String? _validarPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Introduce una contraseña';
    }

    if (value.length < 8) {
      return 'Debe tener mínimo 8 caracteres';
    }

    if (value.length > 20) {
      return 'Debe tener máximo 20 caracteres';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Debe tener una mayúscula';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Debe tener una minúscula';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Debe tener un número';
    }

    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-]').hasMatch(value)) {
      return 'Debe tener un carácter especial';
    }

    return null;
  }

  void _registrar() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFFEFA3C8),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          content: Text(
            'Registro completado para piel $_tipoPiel ✨',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }

  InputDecoration _decoracionCampo({
    required String label,
    required String hint,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(
        icon,
        color: const Color(0xFFD96BA7),
      ),
      suffixIcon: suffixIcon,
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
                            Icons.brush_rounded,
                            size: 46,
                            color: Color(0xFFD96BA7),
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Beauty Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFC94F93),
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          'Crea tu perfil beauty para recibir consejos de maquillaje, piel y bienestar.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF9B6B83),
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 28),

                        TextFormField(
                          decoration: _decoracionCampo(
                            label: 'Nombre',
                            hint: 'Ej: Raquel',
                            icon: Icons.person_rounded,
                          ),
                          textInputAction: TextInputAction.next,
                          validator: _validarNombre,
                        ),

                        const SizedBox(height: 18),

                        TextFormField(
                          decoration: _decoracionCampo(
                            label: 'Email',
                            hint: 'Ej: raquel@email.com',
                            icon: Icons.email_rounded,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: _validarEmail,
                        ),

                        const SizedBox(height: 18),

                        TextFormField(
                          decoration: _decoracionCampo(
                            label: 'Teléfono',
                            hint: 'Ej: 600123456',
                            icon: Icons.phone_rounded,
                          ),
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          validator: _validarTelefono,
                        ),

                        const SizedBox(height: 18),

                        DropdownButtonFormField<String>(
                          value: _tipoPiel,
                          decoration: _decoracionCampo(
                            label: 'Tipo de piel',
                            hint: 'Selecciona tu tipo de piel',
                            icon: Icons.face_retouching_natural_rounded,
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'Normal',
                              child: Text('Normal'),
                            ),
                            DropdownMenuItem(
                              value: 'Seca',
                              child: Text('Seca'),
                            ),
                            DropdownMenuItem(
                              value: 'Grasa',
                              child: Text('Grasa'),
                            ),
                            DropdownMenuItem(
                              value: 'Mixta',
                              child: Text('Mixta'),
                            ),
                            DropdownMenuItem(
                              value: 'Sensible',
                              child: Text('Sensible'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _tipoPiel = value!;
                            });
                          },
                        ),

                        const SizedBox(height: 18),

                        TextFormField(
                          decoration: _decoracionCampo(
                            label: 'Contraseña',
                            hint: 'Ej: Glow2026!',
                            icon: Icons.lock_rounded,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _ocultarPassword
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                color: const Color(0xFFD96BA7),
                              ),
                              onPressed: () {
                                setState(() {
                                  _ocultarPassword = !_ocultarPassword;
                                });
                              },
                            ),
                          ),
                          obscureText: _ocultarPassword,
                          textInputAction: TextInputAction.done,
                          validator: _validarPassword,
                        ),

                        const SizedBox(height: 14),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF0F7),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFF3B6D4),
                            ),
                          ),
                          child: const Text(
                            'La contraseña debe tener entre 8 y 20 caracteres, mayúsculas, minúsculas, números y un símbolo especial.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF9B6B83),
                            ),
                          ),
                        ),

                        const SizedBox(height: 26),

                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton.icon(
                            onPressed: _registrar,
                            icon: const Icon(Icons.favorite_rounded),
                            label: const Text(
                              'Crear perfil beauty',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEFA3C8),
                              foregroundColor: Colors.white,
                              elevation: 5,
                              shadowColor: const Color(0xFFEFA3C8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Brilla bonito, por dentro y por fuera ✨',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFC94F93),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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