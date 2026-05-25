import 'package:flutter/cupertino.dart';

void main() {
  runApp(const BeautyCupertinoApp());
}

class BeautyCupertinoApp extends StatelessWidget {
  const BeautyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Cupertino Beauty Login',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        primaryColor: Color(0xFFD96BA7),
        scaffoldBackgroundColor: Color(0xFFFFF4FA),
        brightness: Brightness.light,
        textTheme: CupertinoTextThemeData(
          primaryColor: Color(0xFFC94F93),
        ),
      ),
      home: CupertinoLoginPage(),
    );
  }
}

class CupertinoLoginPage extends StatefulWidget {
  const CupertinoLoginPage({super.key});

  @override
  State<CupertinoLoginPage> createState() => _CupertinoLoginPageState();
}

class _CupertinoLoginPageState extends State<CupertinoLoginPage> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _ocultarPassword = true;

  String? _errorUsuario;
  String? _errorPassword;

  @override
  void dispose() {
    _usuarioController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validarUsuario(String value) {
    if (value.trim().isEmpty) {
      return 'Introduce tu usuario beauty';
    }

    if (value.trim().length < 3) {
      return 'El usuario debe tener al menos 3 caracteres';
    }

    return null;
  }

  String? _validarPassword(String value) {
    if (value.isEmpty) {
      return 'Introduce tu contraseña';
    }

    if (value.length < 8) {
      return 'Debe tener mínimo 8 caracteres';
    }

    if (value.length > 20) {
      return 'Debe tener máximo 20 caracteres';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Debe incluir una letra mayúscula';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Debe incluir una letra minúscula';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Debe incluir un número';
    }

    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-]').hasMatch(value)) {
      return 'Debe incluir un carácter especial';
    }

    return null;
  }

  void _validarLogin() {
    final String usuario = _usuarioController.text;
    final String password = _passwordController.text;

    setState(() {
      _errorUsuario = _validarUsuario(usuario);
      _errorPassword = _validarPassword(password);
    });

    if (_errorUsuario == null && _errorPassword == null) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Login correcto ✨'),
            content: Text(
              'Bienvenida, ${usuario.trim()}.\nTu sesión beauty se ha iniciado correctamente.',
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _limpiarFormulario() {
    _usuarioController.clear();
    _passwordController.clear();

    setState(() {
      _errorUsuario = null;
      _errorPassword = null;
      _ocultarPassword = true;
    });
  }

  BoxDecoration _decoracionTarjeta() {
    return BoxDecoration(
      color: const Color(0xFFFFFBFD),
      borderRadius: BorderRadius.circular(32),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFFEFA3C8).withOpacity(0.35),
          blurRadius: 22,
          offset: const Offset(0, 10),
        ),
      ],
      border: Border.all(
        color: const Color(0xFFFFD7EA),
        width: 1.5,
      ),
    );
  }

  BoxDecoration _decoracionCampo() {
    return BoxDecoration(
      color: CupertinoColors.white,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(
        color: const Color(0xFFF3B6D4),
        width: 1.4,
      ),
    );
  }

  Widget _textoError(String? error) {
    if (error == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          error,
          style: const TextStyle(
            color: Color(0xFFD64C6F),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _campoUsuario() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Usuario',
          style: TextStyle(
            color: Color(0xFFC94F93),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),
        CupertinoTextField(
          controller: _usuarioController,
          placeholder: 'Ej: raquel_beauty',
          prefix: const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Icon(
              CupertinoIcons.person_fill,
              color: Color(0xFFD96BA7),
              size: 22,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 15,
          ),
          decoration: _decoracionCampo(),
          cursorColor: const Color(0xFFD96BA7),
          textInputAction: TextInputAction.next,
          onChanged: (_) {
            if (_errorUsuario != null) {
              setState(() {
                _errorUsuario = _validarUsuario(_usuarioController.text);
              });
            }
          },
        ),
        _textoError(_errorUsuario),
      ],
    );
  }

  Widget _campoPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contraseña',
          style: TextStyle(
            color: Color(0xFFC94F93),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),
        CupertinoTextField(
          controller: _passwordController,
          placeholder: 'Ej: Beauty2026!',
          obscureText: _ocultarPassword,
          prefix: const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Icon(
              CupertinoIcons.lock_fill,
              color: Color(0xFFD96BA7),
              size: 22,
            ),
          ),
          suffix: CupertinoButton(
            padding: const EdgeInsets.only(right: 10),
            minSize: 0,
            onPressed: () {
              setState(() {
                _ocultarPassword = !_ocultarPassword;
              });
            },
            child: Icon(
              _ocultarPassword
                  ? CupertinoIcons.eye_slash_fill
                  : CupertinoIcons.eye_fill,
              color: const Color(0xFFD96BA7),
              size: 22,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 15,
          ),
          decoration: _decoracionCampo(),
          cursorColor: const Color(0xFFD96BA7),
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => _validarLogin(),
          onChanged: (_) {
            if (_errorPassword != null) {
              setState(() {
                _errorPassword = _validarPassword(_passwordController.text);
              });
            }
          },
        ),
        _textoError(_errorPassword),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Cupertino Login',
          style: TextStyle(
            color: Color(0xFFC94F93),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFFE3F1),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFFFC4DE),
            width: 0.6,
          ),
        ),
      ),
      child: Container(
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
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: _decoracionTarjeta(),
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
                            color: const Color(0xFFEFA3C8).withOpacity(0.38),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        CupertinoIcons.sparkles,
                        size: 46,
                        color: Color(0xFFD96BA7),
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'Beauty Glow',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFC94F93),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Login estilo iOS para entrar en tu espacio de maquillaje, bienestar y autocuidado.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF9B6B83),
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 28),

                    _campoUsuario(),

                    const SizedBox(height: 18),

                    _campoPassword(),

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
                          color: Color(0xFF9B6B83),
                          fontSize: 13,
                        ),
                      ),
                    ),

                    const SizedBox(height: 26),

                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        color: const Color(0xFFEFA3C8),
                        borderRadius: BorderRadius.circular(24),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        onPressed: _validarLogin,
                        child: const Text(
                          'Iniciar sesión',
                          style: TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        borderRadius: BorderRadius.circular(24),
                        color: const Color(0xFFFFE3F1),
                        onPressed: _limpiarFormulario,
                        child: const Text(
                          'Limpiar formulario',
                          style: TextStyle(
                            color: Color(0xFFC94F93),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'Versión realizada con widgets Cupertino 🍎🌸',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFC94F93),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}