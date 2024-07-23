import 'package:exen_app/login_page.dart';
import 'package:flutter/material.dart';

class Supervisor extends StatefulWidget {
  const Supervisor({super.key});

  @override
  State<Supervisor> createState() => _SupervisorState();
}

class _SupervisorState extends State<Supervisor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Supervisor name', style: TextStyle(color: Colors.white) ,),
        backgroundColor: Color.fromARGB(255, 2, 2, 2),
        automaticallyImplyLeading: false,
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
                accountName: Text('Supervisor id '),
                accountEmail: Text('user@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/E1.png'),
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

            const Divider(thickness: 2,),

            ListTile(
              title: TextButton(
                onPressed: () {
                 Navigator.push(context, _PastProjects());
                },
                child: const Text('Past Projects'),
              ),
              leading: const Icon(Icons.construction),
            ),
              ListTile(
              title: TextButton(
                onPressed: () {
                 Navigator.push(context, _ServiceHistory());
                },
                child: const Text('Service history'),
              ),
              leading: const Icon(Icons.history),
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

class _ServiceHistory extends MaterialPageRoute<void> {
  _ServiceHistory()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Services',
                style:
                    TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
              ),
             backgroundColor: Color.fromARGB(255, 250, 239, 203),
              elevation: 1.0,
            ),
          );
        });
}

class _PastProjects extends MaterialPageRoute<void> {
  _PastProjects()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Projects',
                style:
                    TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
              ),              
              elevation: 1.0,
              backgroundColor: Color.fromARGB(255, 250, 239, 203),
            ),
            
          );
        });
}