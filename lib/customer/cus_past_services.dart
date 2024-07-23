import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CusPastServices extends StatefulWidget {
  const CusPastServices({super.key});

  @override
  State<CusPastServices> createState() => _CusPastServicesState();
}

class _CusPastServicesState extends State<CusPastServices> {

  late Future<List<Service>> services;

  @override
  void initState() {
    super.initState();
    services = _fetchServices();
  }

  Future<List<Service>> _fetchServices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');

    if (userId == null) {
      throw Exception('User ID not found in SharedPreferences');
    }

    final uri = Uri.parse('http://10.0.2.2/Exen_Limited/Api/get_cus_service.php')
        .replace(queryParameters: {'user_id': userId});

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      print(data);
      return data.map((json) => Service.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    const text = const Text(
      'Service History',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
    return Scaffold(
      appBar: AppBar(
        title: text,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
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
                      //Image.memory(base64Decode(service.descriptionImage)),
                     
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