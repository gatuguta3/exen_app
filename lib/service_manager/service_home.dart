import 'dart:convert';

import 'package:exen_app/emp_profile/Profile.dart';
import 'package:exen_app/login_page.dart';
import 'package:exen_app/service_manager/service_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ServiceHome extends StatefulWidget {
  const ServiceHome({super.key});

  @override
  State<ServiceHome> createState() => _ServiceHomeState();
}

class _ServiceHomeState extends State<ServiceHome> {
  late String userId;
  bool _loading = true;
  bool _error = false;
   Future<List<Service>>? services;

  @override
  void initState() {
    super.initState();
    _loadUserId();
    services = _fetchServices();
  }

  Future<void> _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('user_id') ?? '';
    });
  }

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginPage(),
      ),
    );
  }

  Future<List<Service>> _fetchServices() async {
    final uri = Uri.parse('http://10.0.2.2/Exen_Limited/Api/service_mamanger.php');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        print(data);
        return data.map((json) => Service.fromJson(json)).toList();
      } else {
        print('Failed to load services. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching services: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Services Home',
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
              child: UserAccountsDrawerHeader(
                accountName: Text('$userId'),
                accountEmail: Text('user@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/E1.png'),
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
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const ServiceList();
                      },
                    ),
                  );
                },
                child: const Text('Service List'),
              ),
              leading: const Icon(Icons.list),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Log Out'),
                      content: const Text(
                        'Are you sure you want to log out?',
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            _logout(context);
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
      body: FutureBuilder<List<Service>>(
        future: services,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No services found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Service service = snapshot.data![index];
                return ListTile(
                  title: Text(service.type),
                  subtitle: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date Booked: ${service.dateBooked}'),
                        Text('Description: ${service.description}'),
                        service.descriptionImage.isNotEmpty
                            ? Image.memory(
                                base64Decode(service.descriptionImage),
                                fit: BoxFit.cover,
                              )
                            : Text('No image available'),
                        Text('Status: ${service.status}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Service {
  final String servId;
  final String type;
  final String dateBooked;
  final String custId;
  final String description;
  final String descriptionImage;
  final String status;

  Service({
    required this.servId,
    required this.type,
    required this.dateBooked,
    required this.custId,
    required this.description,
    required this.descriptionImage,
    required this.status,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      servId: json['Serv_id'],
      type: json['Type'],
      dateBooked: json['Date_Booked'],
      custId: json['Cust_Id'],
      description: json['Description'],
      descriptionImage: json['Description_Image'],
      status: json['Status'],
    );
  }
}
