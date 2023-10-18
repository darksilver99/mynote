import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_note/main.dart';
import 'package:my_note/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('loginTest', (WidgetTester tester) async {
    _overrideOnError();

    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));

    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(ValueKey('email_o6g0')), 'oosayaoo@hotmail.com');
    await tester.enterText(find.byKey(ValueKey('password_5xae')), '04560456');
    await tester.tap(find.byKey(ValueKey('Button_4jyt')));
    await tester.pumpAndSettle();
    expect(find.text('add'), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
