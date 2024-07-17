import 'package:flutter/material.dart';
import 'package:exen_app/login_page.dart';

class Driver extends StatefulWidget {
  const Driver({super.key});

  static const kRouteName = '/nav_routes_ex';

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Driver name',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: const UserAccountsDrawerHeader(
                accountName: Text('Driver id'),
                accountEmail: Text('user@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/student1.jpeg'),
                ),
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.push(context, _ProfilePage());
                },
                child: const Text('Profile'),
              ),
              leading: const Icon(Icons.person),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.push(context, _MyDeliveries());
                },
                child: const Text('Past deliveries'),
              ),
              leading: const Icon(Icons.delivery_dining),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Log Out'),
                      content: const Text(
                        'Are you sure you want to log out ?',
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const LoginPage();
                                },
                              ),
                            );
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Logout'),
              ),
              leading: const Icon(Icons.logout_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfilePage extends MaterialPageRoute<void> {
  _ProfilePage()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Profile',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black,
              elevation: 1.0,
            ),
          );
        });
}

class _MyDeliveries extends MaterialPageRoute<void> {
  _MyDeliveries()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'My Deliveries',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black,
              elevation: 1.0,
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  TextButton(onPressed: () { Navigator.push(context, _MyDeliveries());} , child: Text('home'))
                ],
              ),
            ),
          );
        });
}
