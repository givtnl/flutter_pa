import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/error_screen.dart';
import 'analytics/mixpanel_manager.dart';
import 'flavors_config.dart';
import 'main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MixpanelManager.mixpanel.setUrl(URL_QA + '/tracking');
  await MixpanelManager.mixpanel.flushEvents();
  ErrorWidget.builder = (FlutterErrorDetails details) => ErrorScreen();
  FlavorConfig(flavor: Flavor.QA, values: FlavorValues(baseUrl: URL_QA));
  runApp(MyApp());
}
