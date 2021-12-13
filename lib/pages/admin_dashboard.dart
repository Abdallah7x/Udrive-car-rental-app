import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          titleSpacing: 0.0,
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.cyan,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Image.asset('assets/man.png', width: 50.0)],
                    ),
                  )),
              const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    'Dashboard',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/admin_users');
                          },
                          child: SizedBox(
                              width: 160.0,
                              height: 160.0,
                              child: Card(
                                color: Color.fromARGB(255, 21, 21, 21),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/categories.png',
                                            width: 64.0,
                                          ),
                                          const SizedBox(height: 10.0),
                                          const Text('Categories',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                              )),
                                          const SizedBox(height: 5.0),
                                          const Text('2 Items',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100))
                                        ],
                                      )),
                                ),
                              ))),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/admin_users');
                          },
                          child: SizedBox(
                              width: 160.0,
                              height: 160.0,
                              child: Card(
                                color: Color.fromARGB(255, 21, 21, 21),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/promote.png',
                                            width: 64.0,
                                          ),
                                          const SizedBox(height: 10.0),
                                          const Text('Cars',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                              )),
                                          const SizedBox(height: 5.0),
                                          const Text('2 Items',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100))
                                        ],
                                      )),
                                ),
                              ))),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/admin_users');
                          },
                          child: SizedBox(
                              width: 160.0,
                              height: 160.0,
                              child: Card(
                                color: Color.fromARGB(255, 21, 21, 21),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/car-insurance.png',
                                            width: 64.0,
                                          ),
                                          const SizedBox(height: 10.0),
                                          const Text('ADs',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                              )),
                                          const SizedBox(height: 5.0),
                                          const Text('2 Items',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100))
                                        ],
                                      )),
                                ),
                              ))),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/admin_users');
                          },
                          child: SizedBox(
                              width: 160.0,
                              height: 160.0,
                              child: Card(
                                color: Color.fromARGB(255, 21, 21, 21),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/resume.png',
                                            width: 64.0,
                                          ),
                                          const SizedBox(height: 10.0),
                                          const Text('Users',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                              )),
                                          const SizedBox(height: 5.0),
                                          const Text('2 Items',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100))
                                        ],
                                      )),
                                ),
                              )))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
