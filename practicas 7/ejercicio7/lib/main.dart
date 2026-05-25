import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const CupertinoBeautyApp());
}

class CupertinoBeautyApp extends StatelessWidget {
  const CupertinoBeautyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Registro Beauty Cupertino',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        primaryColor: Color(0xFFD96BA7),
        scaffoldBackgroundColor: Color(0xFFFFF4FA),
        brightness: Brightness.light,
      ),
      home: CupertinoBeautyFormPage(),
    );
  }
}

class CupertinoBeautyFormPage extends StatefulWidget {
  const CupertinoBeautyFormPage({super.key});

  @override
  State<CupertinoBeautyFormPage> createState() =>
      _CupertinoBeautyFormPageState();
}

class _CupertinoBeautyFormPageState extends State<CupertinoBeautyFormPage> {
  final TextEditingController _nombreController =
      TextEditingController(text: 'Raquel Aller');
  final TextEditingController _emailController =
      TextEditingController(text: 'raquel@email.com');
  final TextEditingController _edadController = TextEditingController(text: '26');
  final TextEditingController _observacionesController =
      TextEditingController(text: 'Le gusta el maquillaje natural.');

  final List<String> _provincias = [
    'Almería',
    'Cádiz',
    'Córdoba',
    'Granada',
    'Huelva',
    'Jaén',
    'Málaga',
    'Sevilla',
  ];

  String _provincia = 'Málaga';
  String _tipoServicio = 'Maquillaje';

  bool _aceptaPrivacidad = true;
  bool _clienteActiva = true;

  String? _errorNombre;
  String? _errorEmail;
  String? _errorEdad;
  String? _errorPrivacidad;

  bool _mostrarResumen = false;

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _edadController.dispose();
    _observacionesController.dispose();
    super.dispose();
  }

  String? _validarNombre(String value) {
    if (value.trim().isEmpty) {
      return 'El nombre es obligatorio';
    }

    if (value.trim().length < 3) {
      return 'El nombre debe tener al menos 3 caracteres';
    }

    return null;
  }

  String? _validarEmail(String value) {
    if (value.trim().isEmpty) {
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

  String? _validarEdad(String value) {
    if (value.trim().isEmpty) {
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

  bool _validarFormulario() {
    setState(() {
      _errorNombre = _validarNombre(_nombreController.text);
      _errorEmail = _validarEmail(_emailController.text);
      _errorEdad = _validarEdad(_edadController.text);

      if (_aceptaPrivacidad) {
        _errorPrivacidad = null;
      } else {
        _errorPrivacidad = 'Debes aceptar la política de privacidad';
      }
    });

    return _errorNombre == null &&
        _errorEmail == null &&
        _errorEdad == null &&
        _errorPrivacidad == null;
  }

  void _guardarRegistro() {
    if (_validarFormulario()) {
      setState(() {
        _mostrarResumen = true;
      });

      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Registro guardado ✨'),
            content: const Text(
              'La ficha beauty se ha guardado correctamente.',
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
    _nombreController.clear();
    _emailController.clear();
    _edadController.clear();
    _observacionesController.clear();

    setState(() {
      _provincia = 'Málaga';
      _tipoServicio = 'Maquillaje';

      _aceptaPrivacidad = false;
      _clienteActiva = true;

      _errorNombre = null;
      _errorEmail = null;
      _errorEdad = null;
      _errorPrivacidad = null;

      _mostrarResumen = false;
    });
  }

  BoxDecoration _decoracionTarjeta() {
    return BoxDecoration(
      color: const Color(0xFFFFFBFD),
      borderRadius: BorderRadius.circular(32),
      border: Border.all(
        color: const Color(0xFFFFD7EA),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFFEFA3C8).withOpacity(0.35),
          blurRadius: 22,
          offset: const Offset(0, 10),
        ),
      ],
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

  Widget _tituloCampo(String texto) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          texto,
          style: const TextStyle(
            color: Color(0xFFC94F93),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
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

  Widget _campoTexto({
    required String titulo,
    required String placeholder,
    required Color iconColor,
    required IconData icon,
    required TextEditingController controller,
    required String? error,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    List<TextInputFormatter>? inputFormatters,
    void Function(String)? onChanged,
  }) {
    return Column(
      children: [
        _tituloCampo(titulo),
        CupertinoTextField(
          controller: controller,
          placeholder: placeholder,
          keyboardType: keyboardType,
          maxLines: maxLines,
          cursorColor: const Color(0xFFD96BA7),
          inputFormatters: inputFormatters,
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 15,
          ),
          prefix: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Icon(
              icon,
              color: iconColor,
              size: 22,
            ),
          ),
          decoration: _decoracionCampo(),
          onChanged: onChanged,
        ),
        _textoError(error),
      ],
    );
  }

  void _abrirSelectorProvincia() {
    int indiceSeleccionado = _provincias.indexOf(_provincia);

    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 310,
          color: const Color(0xFFFFF4FA),
          child: Column(
            children: [
              Container(
                height: 52,
                color: const Color(0xFFFFE3F1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Color(0xFFC94F93),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: const Text(
                        'Aceptar',
                        style: TextStyle(
                          color: Color(0xFFC94F93),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _provincia = _provincias[indiceSeleccionado];
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  backgroundColor: const Color(0xFFFFF4FA),
                  itemExtent: 38,
                  scrollController: FixedExtentScrollController(
                    initialItem: indiceSeleccionado,
                  ),
                  onSelectedItemChanged: (index) {
                    indiceSeleccionado = index;
                  },
                  children: _provincias
                      .map(
                        (provincia) => Center(
                          child: Text(
                            provincia,
                            style: const TextStyle(
                              color: Color(0xFF7A4B61),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _selectorProvincia() {
    return Column(
      children: [
        _tituloCampo('Provincia andaluza'),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _abrirSelectorProvincia,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 15,
            ),
            decoration: _decoracionCampo(),
            child: Row(
              children: [
                const Icon(
                  CupertinoIcons.location_solid,
                  color: Color(0xFFD96BA7),
                  size: 22,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _provincia,
                    style: const TextStyle(
                      color: Color(0xFF7A4B61),
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(
                  CupertinoIcons.chevron_down,
                  color: Color(0xFFD96BA7),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _radioServicio(String value) {
    final bool seleccionado = _tipoServicio == value;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          _tipoServicio = value;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              seleccionado ? const Color(0xFFFFE3F1) : CupertinoColors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: seleccionado
                ? const Color(0xFFD96BA7)
                : const Color(0xFFF3B6D4),
            width: 1.4,
          ),
        ),
        child: Row(
          children: [
            Icon(
              seleccionado
                  ? CupertinoIcons.largecircle_fill_circle
                  : CupertinoIcons.circle,
              color: const Color(0xFFD96BA7),
              size: 22,
            ),
            const SizedBox(width: 10),
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF7A4B61),
                fontSize: 15.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _grupoRadioServicios() {
    return Container(
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
          const SizedBox(height: 8),
          _radioServicio('Maquillaje'),
          _radioServicio('Skincare'),
          _radioServicio('Masaje relajante'),
        ],
      ),
    );
  }

  Widget _checkboxPrivacidad() {
    return Column(
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              _aceptaPrivacidad = !_aceptaPrivacidad;

              if (_aceptaPrivacidad) {
                _errorPrivacidad = null;
              } else {
                _errorPrivacidad = 'Debes aceptar la política de privacidad';
              }
            });
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0F7),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: const Color(0xFFF3B6D4),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  _aceptaPrivacidad
                      ? CupertinoIcons.check_mark_circled_solid
                      : CupertinoIcons.circle,
                  color: const Color(0xFFD96BA7),
                  size: 26,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Acepta la política de privacidad',
                    style: TextStyle(
                      color: Color(0xFF7A4B61),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _textoError(_errorPrivacidad),
      ],
    );
  }

  Widget _switchClienteActiva() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0F7),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFF3B6D4),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.person_crop_circle_badge_checkmark,
            color: Color(0xFFD96BA7),
            size: 27,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Cliente activa en la base de datos',
              style: TextStyle(
                color: Color(0xFF7A4B61),
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          CupertinoSwitch(
            value: _clienteActiva,
            activeTrackColor: const Color(0xFFEFA3C8),
            onChanged: (value) {
              setState(() {
                _clienteActiva = value;
              });
            },
          ),
        ],
      ),
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
            CupertinoIcons.sparkles,
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
          _filaResumen(
            CupertinoIcons.person_fill,
            'Nombre: ${_nombreController.text}',
          ),
          _filaResumen(
            CupertinoIcons.mail_solid,
            'Email: ${_emailController.text}',
          ),
          _filaResumen(
            CupertinoIcons.calendar,
            'Edad: ${_edadController.text} años',
          ),
          _filaResumen(
            CupertinoIcons.location_solid,
            'Provincia: $_provincia',
          ),
          _filaResumen(
            CupertinoIcons.heart_fill,
            'Servicio favorito: $_tipoServicio',
          ),
          _filaResumen(
            CupertinoIcons.checkmark_seal_fill,
            _clienteActiva ? 'Cliente activa' : 'Cliente inactiva',
          ),
          _filaResumen(
            CupertinoIcons.doc_text_fill,
            'Observaciones: ${_observacionesController.text}',
          ),
        ],
      ),
    );
  }

  Widget _filaResumen(IconData icon, String texto) {
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
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Ficha Beauty',
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
              padding: const EdgeInsets.all(22),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: _decoracionTarjeta(),
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
                            color: const Color(0xFFEFA3C8).withOpacity(0.38),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        CupertinoIcons.heart_circle_fill,
                        size: 50,
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
                      'Formulario Cupertino para crear o editar un registro de base de datos.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF9B6B83),
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 28),

                    _campoTexto(
                      titulo: 'Nombre completo',
                      placeholder: 'Ej: Raquel Aller',
                      iconColor: const Color(0xFFD96BA7),
                      icon: CupertinoIcons.person_fill,
                      controller: _nombreController,
                      error: _errorNombre,
                      onChanged: (_) {
                        if (_errorNombre != null) {
                          setState(() {
                            _errorNombre =
                                _validarNombre(_nombreController.text);
                          });
                        }
                      },
                    ),

                    const SizedBox(height: 18),

                    _campoTexto(
                      titulo: 'Correo electrónico',
                      placeholder: 'Ej: raquel@email.com',
                      iconColor: const Color(0xFFD96BA7),
                      icon: CupertinoIcons.mail_solid,
                      controller: _emailController,
                      error: _errorEmail,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (_) {
                        if (_errorEmail != null) {
                          setState(() {
                            _errorEmail = _validarEmail(_emailController.text);
                          });
                        }
                      },
                    ),

                    const SizedBox(height: 18),

                    _campoTexto(
                      titulo: 'Edad',
                      placeholder: 'Entre 16 y 90',
                      iconColor: const Color(0xFFD96BA7),
                      icon: CupertinoIcons.calendar,
                      controller: _edadController,
                      error: _errorEdad,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (_) {
                        if (_errorEdad != null) {
                          setState(() {
                            _errorEdad = _validarEdad(_edadController.text);
                          });
                        }
                      },
                    ),

                    const SizedBox(height: 18),

                    _selectorProvincia(),

                    const SizedBox(height: 18),

                    _campoTexto(
                      titulo: 'Observaciones',
                      placeholder: 'Preferencias beauty de la clienta',
                      iconColor: const Color(0xFFD96BA7),
                      icon: CupertinoIcons.doc_text_fill,
                      controller: _observacionesController,
                      error: null,
                      maxLines: 3,
                    ),

                    const SizedBox(height: 22),

                    _grupoRadioServicios(),

                    const SizedBox(height: 14),

                    _checkboxPrivacidad(),

                    const SizedBox(height: 14),

                    _switchClienteActiva(),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        color: const Color(0xFFEFA3C8),
                        borderRadius: BorderRadius.circular(24),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        onPressed: _guardarRegistro,
                        child: const Text(
                          'Guardar registro',
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
                        color: const Color(0xFFFFE3F1),
                        borderRadius: BorderRadius.circular(24),
                        padding: const EdgeInsets.symmetric(vertical: 14),
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

                    _resumenRegistro(),
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