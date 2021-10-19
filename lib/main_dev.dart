import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/error_screen.dart';
import 'analytics/mixpanel_manager.dart';
import 'flavors_config.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MixpanelManager.mixpanel.flushEvents();
  ErrorWidget.builder = (FlutterErrorDetails details) => ErrorScreen();
  FlavorConfig(flavor: Flavor.DEV, values: FlavorValues(baseUrl: "ah yeet tga nie werken wi"));
  runApp(MyApp());
}