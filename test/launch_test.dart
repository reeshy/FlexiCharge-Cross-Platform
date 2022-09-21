// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flexicharge/app/app.locator.dart';
import 'package:flexicharge/app/setup_dialog_ui.dart';
import 'package:flexicharge/models/widget_keys.dart';
import 'package:flexicharge/ui/screens/home_page/home_view.dart';
import 'package:flexicharge/ui/screens/launch/launch_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flexicharge/main.dart';

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    setupLocator();
    setupBottomSheetUi();
  });

  Widget createWidgetForTesting({required Widget child}) {
    return ProviderScope(
        child: MaterialApp(
      home: child,
    ));
  }

  testWidgets('Verify that Flexicharge logo is displayed in Splash Screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(
      child: LaunchView(),
    ));

    final splashScreenImage = find.byKey(WidgetKeys.SplashScreenImage);

    expect(splashScreenImage, findsOneWidget);
  });

  testWidgets('Test home screen', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(
      child: HomeView(),
    ));

    final findChargerButton = find.byKey(WidgetKeys.FindChargerButton);

    expect(findChargerButton, findsOneWidget);
  });
}