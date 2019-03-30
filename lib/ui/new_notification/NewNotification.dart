import 'package:flutter/material.dart';
import '../empty_state/empty_state_widget.dart';

class NewNotification extends StatefulWidget {
  // final Widget child;

  // NewNotification({Key key, this.child}) : super(key: key);

  _NewNotificationState createState() => _NewNotificationState();
}

class _NewNotificationState extends State<NewNotification> {
  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget();
  }
}
