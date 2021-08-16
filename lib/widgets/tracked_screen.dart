import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';

class TrackedScreen extends StatelessWidget {

  final Widget child;
  final String screenName;

  TrackedScreen({required this.child, required this.screenName});

  @override
  Widget build(BuildContext context) {
    MixpanelManager.mixpanel.track("LOADED_$screenName");
    return Container(child: child,);
  }
}
