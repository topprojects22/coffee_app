import 'dart:async';

import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/notification_controller.dart';
import 'package:boilerplate/presentation/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Initialize splash screen
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Set orientations
  await setPreferredOrientations();

  // Initialize dependency injection
  await ServiceLocator.configureDependencies();

  // Always initialize Awesome Notifications
  // await NotificationController.initializeLocalNotifications();
  // await NotificationController.initializeIsolateReceivePort();

  runApp(MyApp());
  // FlutterNativeSplash.remove();
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
