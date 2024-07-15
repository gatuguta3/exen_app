import 'package:flutter/material.dart';
import 'package:exen_app/login_page.dart';

class Installer extends StatefulWidget {
  const Installer({super.key});

  @override
  State<Installer> createState() => _InstallerState();
}

class _InstallerState extends State<Installer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Driver name',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
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
                accountName: Text('Installer id'),
                accountEmail: Text('user@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(''),
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
                  Navigator.push(context, _MyWorks());
                },
                child: const Text('Past works'),
              ),
              leading: const Icon(Icons.work_history),
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
      : super(builder: (BuildContext) {
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

class _MyWorks extends MaterialPageRoute<void> {
  _MyWorks()
      : super(builder: (BuildContext) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'My Deliveries',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black,
              elevation: 1.0,
            ),
          );
        });
}
