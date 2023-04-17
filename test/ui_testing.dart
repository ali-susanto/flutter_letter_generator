import 'package:e_letter/screen/content/content_viewModel.dart';
import 'package:e_letter/screen/mobile/home/home_screen_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  var _contentProvider = MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ContentViewModel())],
    child: const MaterialApp(home: HomeScreenMobile()),
  );
  group('test', () {
    testWidgets('content list', (WidgetTester tester) async {
      await tester.pumpWidget(_contentProvider);
      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
