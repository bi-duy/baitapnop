import 'package:flutter_test/flutter_test.dart';
import 'package:dart_practice/main.dart';

void main() {
  testWidgets('ProfileApp loads and shows Profile screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ProfileApp());
    await tester.pump();

    expect(find.text('Profile'), findsWidgets);
    expect(find.text('Nguyễn Nhật Duy'), findsWidgets);
  });
}
