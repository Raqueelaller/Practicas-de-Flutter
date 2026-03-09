import 'package:flutter/cupertino.dart';
import 'package:cupertino_native/cupertino_native.dart';

void main() {
  runApp(const GlowAndGoApp());
}

class GlowAndGoApp extends StatelessWidget {
  const GlowAndGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: GlowHomePage(),
    );
  }
}

class GlowHomePage extends StatefulWidget {
  const GlowHomePage({super.key});

  @override
  State<GlowHomePage> createState() => _GlowHomePageState();
}

class _GlowHomePageState extends State<GlowHomePage> {
  bool darkMode = false;
  bool skincareDone = true;
  bool workoutDone = false;
  double waterLevel = 1.8;
  int selectedSection = 0;

  final List<String> sections = [
    'Makeup',
    'Gym',
    'Skincare',
    'Cute habits',
  ];

  final List<_RoutineItem> routine = [
    _RoutineItem(
      title: 'Maquillaje natural',
      subtitle: 'Base ligera, gloss y colorete',
      icon: CupertinoIcons.heart_fill,
    ),
    _RoutineItem(
      title: 'Entreno glúteo',
      subtitle: '40 min + estiramientos',
      icon: CupertinoIcons.sportscourt_fill,
    ),
    _RoutineItem(
      title: 'Rutina de noche',
      subtitle: 'Limpieza, sérum y crema',
      icon: CupertinoIcons.moon_stars_fill,
    ),
    _RoutineItem(
      title: 'Self-care cute',
      subtitle: 'Matcha, journaling y velita',
      icon: CupertinoIcons.sparkles,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        brightness: darkMode ? Brightness.dark : Brightness.light,
        primaryColor: CupertinoColors.systemPink,
        scaffoldBackgroundColor:
            darkMode ? CupertinoColors.black : CupertinoColors.systemGroupedBackground,
      ),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Glow & Go'),
          trailing: CupertinoSwitch(
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            },
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildHeaderCard(),
              const SizedBox(height: 18),
              _buildSectionSelector(),
              const SizedBox(height: 18),
              _buildGoalsCard(),
              const SizedBox(height: 18),
              _buildRoutineList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: darkMode
            ? CupertinoColors.systemGrey6.darkColor
            : CupertinoColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mi rutina bonita del día',
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
          const SizedBox(height: 8),
          const Text(
            'Una app de autocuidado con estilo iPhone para probar colores, tema claro/oscuro y widgets Cupertino.',
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _miniTag('Pink vibe', CupertinoColors.systemPink),
              const SizedBox(width: 8),
              _miniTag('Healthy', CupertinoColors.systemGreen),
              const SizedBox(width: 8),
              _miniTag('Cute', CupertinoColors.systemPurple),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.18),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }

  Widget _buildSectionSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sección favorita',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CupertinoSlidingSegmentedControl<int>(
          groupValue: selectedSection,
          children: const {
            0: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Makeup'),
            ),
            1: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Gym'),
            ),
            2: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Skin'),
            ),
            3: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Cute'),
            ),
          },
          onValueChanged: (value) {
            if (value != null) {
              setState(() {
                selectedSection = value;
              });
            }
          },
        ),
        const SizedBox(height: 12),
        Text(
          'Actualmente estás viendo: ${sections[selectedSection]}',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildGoalsCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: darkMode
            ? CupertinoColors.systemGrey6.darkColor
            : CupertinoColors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Objetivos del día',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Rutina skincare'),
              CupertinoSwitch(
                value: skincareDone,
                activeColor: CupertinoColors.systemPink,
                onChanged: (value) {
                  setState(() {
                    skincareDone = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Entrenamiento hecho'),
              CupertinoSwitch(
                value: workoutDone,
                activeColor: CupertinoColors.systemGreen,
                onChanged: (value) {
                  setState(() {
                    workoutDone = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text('Agua bebida: ${waterLevel.toStringAsFixed(1)} L'),
          CupertinoSlider(
            value: waterLevel,
            min: 0.5,
            max: 3.5,
            divisions: 6,
            activeColor: CupertinoColors.systemTeal,
            onChanged: (value) {
              setState(() {
                waterLevel = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRoutineList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ideas de rutina',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...routine.map(
          (item) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: darkMode
                  ? CupertinoColors.systemGrey6.darkColor
                  : CupertinoColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CupertinoListTile(
              leading: Icon(
                item.icon,
                color: CupertinoColors.systemPink,
              ),
              title: Text(item.title),
              subtitle: Text(item.subtitle),
              trailing: const Icon(CupertinoIcons.chevron_forward, size: 18),
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text(item.title),
                    content: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Has pulsado la sección "${item.title}". Aquí podrías abrir otra pantalla con más detalles.',
                      ),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('Cerrar'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _RoutineItem {
  final String title;
  final String subtitle;
  final IconData icon;

  _RoutineItem({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}