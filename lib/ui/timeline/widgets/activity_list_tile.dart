import 'package:flutter/material.dart';

class ActivityListTile extends StatelessWidget {
  final String title;
  final bool shouldShowArrow;
  final bool shouldShowSwitch;
  final Function onSwitchValueChange;
  final bool switchValue;
  final Function onItemPressed;

  ActivityListTile(
      {this.title,
      this.shouldShowArrow = true,
      this.shouldShowSwitch = false,
      this.onSwitchValueChange,
      this.switchValue = true,
      this.onItemPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemPressed(title);
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Row(
                children: <Widget>[
                  Text(title),
                  Spacer(flex: 1),
                  shouldShowSwitch
                      ? Switch(
                          value: switchValue,
                          onChanged: (bool value) {
                            onSwitchValueChange(value);
                          },
                          activeColor: Colors.teal,
                        )
                      : Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 15,
                        )
                ],
              ),
            ),
            Divider(
              height: 0.8,
            )
          ],
        ),
      ),
    );
  }
}
