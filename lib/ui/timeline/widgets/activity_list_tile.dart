import 'package:flutter/material.dart';

class ActivityListTile extends StatelessWidget {
  final String title;
  final bool shouldShowArrow;
  final bool shouldShowSwitch;
  final Function onSwitchValueChange;
  final bool switchValue;

  ActivityListTile(
      {this.title,
      this.shouldShowArrow = false,
      this.shouldShowSwitch = false,
      this.onSwitchValueChange = null,
      this.switchValue = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  color: Colors.grey,
                  width: 20,
                  height: 20,
                ),
                Text(title),
                Spacer(flex: 1),
                shouldShowArrow
                    ? Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 15,
                      )
                    : shouldShowSwitch
                        ? Switch(
                            value: switchValue,
                            onChanged: (bool value) {
                              onSwitchValueChange(value);
                            },
                            activeColor: Colors.teal,
                          )
                        : Spacer(flex: 1)
              ],
            ),
          ),
          Divider(
            height: 0.8,
          )
        ],
      ),
    );
  }
}
