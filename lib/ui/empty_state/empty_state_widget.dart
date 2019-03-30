import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Container(
                constraints: BoxConstraints.expand(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AspectRatio(
                          aspectRatio: 100 / 100,
                          child: Container(
                              margin: EdgeInsets.all(10),
                              child: Image.asset(
                                  'assets/empty_notification.png'))),
                      Text("No Data Available", textAlign: TextAlign.center)
                    ]))));
  }
}
