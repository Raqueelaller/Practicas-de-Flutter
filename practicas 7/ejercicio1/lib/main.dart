import 'package:flutter/material.dart';

void main() {
  runApp(const BeautyLoginApp());
}

class BeautyLoginApp extends StatelessWidget {
  const BeautyLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beauty Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFEFA3C8),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF4FA),
        fontFamily: 'Arial',
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _ocultarPassword = true;

  @override
  void dispose() {
    _usuarioController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validarUsuario(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Introduce tu usuario para entrar en tu rincón beauty';
    }

    if (value.trim().length < 3) {
      return 'El usuario debe tener al menos 3 caracteres';
    }

    return null;
  }

  String? _validarPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Introduce tu contraseña';
    }

    if (value.length < 8) {
      return 'Debe tener como mínimo 8 caracteres';
    }

    if (value.length > 20) {
      return 'Debe tener como máximo 20 caracteres';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Debe incluir al menos una letra mayúscula';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Debe incluir al menos una letra minúscula';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Debe incluir al menos un número';
    }

    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-]').hasMatch(value)) {
      return 'Debe incluir al menos un carácter especial';
    }

    return null;
  }

  void _iniciarSesion() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFFEFA3C8),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          content: Text(
            'Bienvenida, ${_usuarioController.text.trim()} 💄✨ Login correcto',
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
      prefixIcon: Icon(icon, color: const Color(0xFFD96BA7)),
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
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          color: Color(0xFFD96BA7),
          width: 2.3,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          color: Color(0xFFE57373),
          width: 1.6,
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
              padding: const EdgeInsets.all(24),
              child: Card(
                elevation: 10,
                shadowColor: const Color(0xFFEFA3C8).withOpacity(0.35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(26),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: () {
                      debugPrint('Formulario beauty modificado');
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 92,
                          height: 92,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE3F1),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFEFA3C8).withOpacity(0.35),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.spa,
                            size: 48,
                            color: Color(0xFFD96BA7),
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          'Beauty Glow Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFC94F93),
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          'Entra en tu espacio de belleza, bienestar y autocuidado',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF9B6B83),
                          ),
                        ),

                        const SizedBox(height: 30),

                        TextFormField(
                          controller: _usuarioController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: _decoracionCampo(
                            label: 'Usuario',
                            hint: 'Ej: raquel_beauty',
                            icon: Icons.person_rounded,
                          ),
                          validator: _validarUsuario,
                        ),

                        const SizedBox(height: 20),

                        TextFormField(
                          controller: _passwordController,
                          obscureText: _ocultarPassword,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          decoration: _decoracionCampo(
                            label: 'Contraseña',
                            hint: 'Ej: Beauty2026!',
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
                          validator: _validarPassword,
                          onFieldSubmitted: (_) => _iniciarSesion(),
                        ),

                        const SizedBox(height: 12),

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
                            onPressed: _iniciarSesion,
                            icon: const Icon(Icons.favorite_rounded),
                            label: const Text(
                              'Iniciar sesión',
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

                        const SizedBox(height: 18),

                        const Text(
                          'Cuida tu piel, tu energía y tu brillo interior ✨',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
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