import 'package:flutter/material.dart';

class MyClass extends StatefulWidget {

  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 244, 244),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container(
            //   constraints: BoxConstraints.expand(height: 509),
            //   margin: EdgeInsets.only(top: 96),
            //   child: ListView.builder(
            //     itemCount: 15,
            //     itemBuilder: (context, index) => Item4ItemWidget(),
            //   ),
            // ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    constraints: BoxConstraints.expand(height: 47),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Row(
                          children: [
                            Opacity(
                              opacity: 0.5,
                              child: Container(
                                width: 51,
                                height: 37,
                                margin: EdgeInsets.only(left: 29),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Opacity(
                                    opacity: 0.5,
                                    child: Container(
                                      width: 50,
                                      height: 37,
                                      margin: EdgeInsets.only(right: 33),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 42,
                              height: 37,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}