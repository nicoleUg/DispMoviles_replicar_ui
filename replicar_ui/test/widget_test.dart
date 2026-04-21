import 'package:flutter_test/flutter_test.dart';
import 'package:replicar_ui/main.dart';

void main() {
  testWidgets('Muestra pantalla de perfil', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Perfil de Usuario'), findsOneWidget);
    expect(find.text('Ana García'), findsOneWidget);
    expect(find.text('Editar Perfil'), findsOneWidget);
  });
}