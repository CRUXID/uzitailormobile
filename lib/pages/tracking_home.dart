import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzitailor/pages/pages.dart';

class track extends StatefulWidget {
  @override
  _trackState createState() => _trackState();
}

class _trackState extends State<track> {
  int currentTab = 2;
  final List<Widget> screens = [
    Dashboard(),
    Transaksi(),
    Tracking(),
    Setting(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Tracking();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color:
                              currentTab == 0 ? Color(0xFF2B2D42) : Colors.grey,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                              fontSize: 12,
                              color: currentTab == 0
                                  ? Color(0xFF2B2D42)
                                  : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 100,
                        onPressed: () {
                          setState(() {
                            currentScreen = Transaksi();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.attach_money_outlined,
                              color: currentTab == 1
                                  ? Color(0xFF2B2D42)
                                  : Colors.grey,
                            ),
                            Text(
                              'Transaksi',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: currentTab == 1
                                      ? Color(0xFF2B2D42)
                                      : Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 100,
                    onPressed: () {
                      setState(() {
                        currentScreen = Tracking();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.list_alt_outlined,
                          color: currentTab == 2 ? Colors.black : Colors.grey,
                        ),
                        Text(
                          'Tracking',
                          style: TextStyle(
                              fontSize: 12,
                              color:
                                  currentTab == 2 ? Colors.black : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 88,
                    onPressed: () {
                      setState(() {
                        currentScreen = Setting();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 3 ? Colors.black : Colors.grey,
                        ),
                        Text(
                          'Setting',
                          style: TextStyle(
                              fontSize: 12,
                              color:
                                  currentTab == 3 ? Colors.black : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
