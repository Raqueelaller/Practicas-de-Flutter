import 'package:flutter/cupertino.dart';

void main() {
  runApp(const SelfCareApp());
}

class SelfCareApp extends StatefulWidget {
  const SelfCareApp({super.key});

  @override
  State<SelfCareApp> createState() => _SelfCareAppState();
}

class _SelfCareAppState extends State<SelfCareApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primaryColor: CupertinoColors.systemPink,
      ),
      home: HomePage(
        isDarkMode: isDarkMode,
        onThemeChanged: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> allUsers = const [
    {
      'name': 'Luna',
      'routine': 'Skincare de mañana',
    },
    {
      'name': 'Valeria',
      'routine': 'Pilates y estiramientos',
    },
    {
      'name': 'Emma',
      'routine': 'Maquillaje natural',
    },
    {
      'name': 'Sofía',
      'routine': 'Rutina glow de noche',
    },
    {
      'name': 'Clara',
      'routine': 'Cardio suave y agua',
    },
  ];

  List<Map<String, String>> filteredUsers = [];
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    filteredUsers = allUsers;
  }

  void _updateUserList([String? query]) {
    setState(() {
      if (query == null || query.trim().isEmpty) {
        filteredUsers = allUsers;
      } else {
        filteredUsers = allUsers.where((user) {
          final name = user['name']!.toLowerCase();
          final routine = user['routine']!.toLowerCase();
          final text = query.toLowerCase();

          return name.contains(text) || routine.contains(text);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isDarkMode
        ? CupertinoColors.black
        : CupertinoColors.systemGroupedBackground;

    final cardColor = widget.isDarkMode
        ? CupertinoColors.darkBackgroundGray
        : CupertinoColors.white;

    return CupertinoPageScaffold(
      backgroundColor: bgColor,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('SelfCare Agenda'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: CupertinoSearchTextField(
                onChanged: (value) {
                  _updateUserList(value);
                },
                onSubmitted: (value) {
                  _updateUserList(value);
                },
                onSuffixTap: () {
                  _updateUserList();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoFormSection.insetGrouped(
                header: const Text('Ajustes'),
                children: [
                  CupertinoFormRow(
                    prefix: const Text('Modo oscuro'),
                    child: CupertinoSwitch(
                      value: widget.isDarkMode,
                      onChanged: widget.onThemeChanged,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate,
                onDateTimeChanged: (DateTime newDate) {
                  setState(() {
                    selectedDate = newDate;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = filteredUsers[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user['name']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(user['routine']!),
                      ],
                    ),
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