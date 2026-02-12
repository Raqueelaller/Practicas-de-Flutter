import 'package:flutter_test/flutter_test.dart';
import 'package:listview_application/main.dart';

void main() {
  testWidgets('Se ve el titulo y un item de maquillaje', (WidgetTester tester) async {
    // OJO: tu MyApp NO es const en tu main, por eso no ponemos const aquí
    await tester.pumpWidget(MyApp());

    // Comprueba que aparece el titulo del AppBar
    expect(find.text('Lista de maquillaje'), findsOneWidget);

    // Comprueba que aparece un elemento de la lista
    expect(find.text('Base'), findsOneWidget);
  });
}
