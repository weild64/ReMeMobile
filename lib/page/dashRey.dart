import 'package:flutter/material.dart';

import 'ReyPage.dart';

class dashmenuRey extends StatefulWidget {
  @override
  _dashmenuReyState createState() => _dashmenuReyState();
}

class _dashmenuReyState extends State<dashmenuRey> {
  int currentTab = 0;
  final List<Widget> screens = [
    SchedTableRey(),
    Donorey(),
    profilerey(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = profilerey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.grey.shade50,
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = profilerey();
                              currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person,
                                  color: currentTab == 0
                                      ? Colors.blue
                                      : Colors.grey),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    color: currentTab == 0
                                        ? Colors.blue
                                        : Colors.grey),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Donorey();
                              currentTab = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.monetization_on,
                                  color: currentTab == 1
                                      ? Colors.blue
                                      : Colors.grey),
                              Text(
                                "Donations",
                                style: TextStyle(
                                    color: currentTab == 1
                                        ? Colors.blue
                                        : Colors.grey),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = SchedTableRey();
                              currentTab = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.schedule,
                                  color: currentTab == 2
                                      ? Colors.blue
                                      : Colors.grey),
                              Text(
                                "Live Schedule",
                                style: TextStyle(
                                    color: currentTab == 2
                                        ? Colors.blue
                                        : Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ))));
  }
}
