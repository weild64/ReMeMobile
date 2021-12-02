import 'package:flutter/material.dart';

import 'LilyPage.dart';

class dashmenuLy extends StatefulWidget {
  @override
  _dashmenuLyState createState() => _dashmenuLyState();
}

class _dashmenuLyState extends State<dashmenuLy> {
  int currentTab = 0;
  final List<Widget> screens = [
    SchedTableLily(),
    Donolily(),
    profilelily(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = profilelily();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.white,
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
                              currentScreen = profilelily();
                              currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person,
                                  color: currentTab == 0
                                      ? Colors.pink.shade200
                                      : Colors.grey),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    color: currentTab == 0
                                        ? Colors.pink.shade200
                                        : Colors.grey),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Donolily();
                              currentTab = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.monetization_on,
                                  color: currentTab == 1
                                      ? Colors.pink.shade200
                                      : Colors.grey),
                              Text(
                                "Donations",
                                style: TextStyle(
                                    color: currentTab == 1
                                        ? Colors.pink.shade200
                                        : Colors.grey),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = SchedTableLily();
                              currentTab = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.schedule,
                                  color: currentTab == 2
                                      ? Colors.pink.shade200
                                      : Colors.grey),
                              Text(
                                "Live Schedule",
                                style: TextStyle(
                                    color: currentTab == 2
                                        ? Colors.pink.shade200
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
