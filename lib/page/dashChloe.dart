import 'package:flutter/material.dart';

import 'ChloePage.dart';

class dashmenuChloe extends StatefulWidget {
  @override
  _dashmenuChloeState createState() => _dashmenuChloeState();
}

class _dashmenuChloeState extends State<dashmenuChloe> {
  int currentTab = 0;
  final List<Widget> screens = [
    SchedTableChloe(),
    Donochloe(),
    profilechloe(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = profilechloe();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.yellow.shade50,
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
                              currentScreen = profilechloe();
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
                              currentScreen = Donochloe();
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
                              currentScreen = SchedTableChloe();
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
