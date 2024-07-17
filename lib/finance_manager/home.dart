import 'package:exen_app/emp_profile/Profile.dart';
import 'package:exen_app/login_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Finance manager name',
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
                accountName: Text('Designer Id '),
                accountEmail: Text('user@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/student1.jpeg'),
                ),
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                   Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const Profile();
                                },
                              ),
                            );
                },
                child: const Text('Profile'),
              ),
              leading: const Icon(Icons.person),
            ),

            const Divider(thickness: 2,),
            ListTile(
              title: TextButton(
                onPressed: () {
                   Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const Profile();
                                },
                              ),
                            );
                },
                child: const Text('Transactions'),
              ),
              leading: const Icon(Icons.payments),
            ),

            const Divider(thickness: 2,),


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

