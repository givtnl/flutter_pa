import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';

class TrackedScreen extends StatefulWidget {

  final Widget child;
  final String screenName;

  TrackedScreen({required this.child, required this.screenName});

  @override
  _TrackedScreenState createState() => _TrackedScreenState();
}

class _TrackedScreenState extends State<TrackedScreen> {

  @override
  void initState() {
    MixpanelManager.mixpanel.track("LOADED", properties: {"SCREEN_NAME" : widget.screenName});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: widget.child,);
  }
}
