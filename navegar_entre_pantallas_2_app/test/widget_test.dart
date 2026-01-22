import 'package:flutter_test/flutter_test.dart';
import 'package:navegar_entre_pantallas_2_app/main.dart';

void main() {
  testWidgets('Se muestra la pantalla inicio', (WidgetTester tester) async {

    // Construimos la app
    await tester.pumpWidget(MiApp());

    // Comprobamos que aparece el título del inicio
    expect(find.text('Inicio (GridView)'), findsOneWidget);

    // Comprobamos que existe un botón del grid
    expect(find.text('Ejercicio 4'), findsOneWidget);
  });
}
