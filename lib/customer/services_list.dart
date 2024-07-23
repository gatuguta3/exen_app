
//import 'package:exen_app/customer/service_booking_page.dart';
import 'dart:io';

import 'package:exen_app/customer/cus_homepage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesList extends StatefulWidget {
  const ServicesList({super.key});

  @override
  State<ServicesList> createState() => _ServiceState();
}

class _ServiceState extends State<ServicesList> {
  @override
  Widget build(BuildContext context) {
    
    final List<String> services = ["Repair", "Installation", "Consultation"];

    return Scaffold(
       appBar: AppBar(
              title: const Text(
                'Services',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black,
              elevation: 1.0,
            ),
             backgroundColor: Color.fromRGBO(223, 220, 220, 1)  ,   
            body:
            
             SingleChildScrollView(
              
              child: Center(
                
                child: Column(
                  children: [
                    
                   SizedBox(
                    width: 350,
                    height: 350,
                    child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 250.0,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              'images/repair.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 16.0,
                            left: 16.0,
                            right: 16.0,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Repair',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[                  
                        TextButton(
                          onPressed: () {
                          //Navigator.push(context, _ServicesBookingPage(service: services[0]));
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ServiceBookingPage(service: services[0]),
                                    ),
                                  );
                          },
                          child: const Text('BOOK NOW '),
                        ),
                      ],
                    ),
                    ],
                    ),
                            ),
                          ),
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                    width: 350,
                    height: 350,
                    child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 250.0,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              'images/applianceInstallation.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 16.0,
                            left: 16.0,
                            right: 16.0,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Installation',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[                    
                        TextButton(
                          onPressed: () {
                      // Navigator.push(context, _ServicesBookingPage(service: services[1]));
                           Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ServiceBookingPage(service: services[1]),
                                    ),
                                  );
                         
                          },
                          child: const Text('BOOK NOW'),
                        ),
                      ],
                    ),
                    ],
                    ),
                            ),
                          ),
                  ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                    width: 350,
                    height: 350,
                    child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 250.0,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              'images/consultations.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 16.0,
                            left: 16.0,
                            right: 16.0,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Consultations',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[                        
                        TextButton(
                          onPressed: () {
                            // Navigator.push(context, _ServicesBookingPage(service: services[2]));
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ServiceBookingPage(service: services[2]),
                                    ),
                                  );
                          },
                          child: const Text('BOOK NOW'),
                        ),
                      ],
                    ),
                    ],
                    ),
                            ),
                          ),
                  ),
                  ),

                  
                  ],
                ),
              ),
            ),

    );
  }
}

class ServiceBookingPage extends StatefulWidget {
  final String service;

  ServiceBookingPage({required this.service});

  @override
  _ServiceBookingPageState createState() => _ServiceBookingPageState();
}

class _ServiceBookingPageState extends State<ServiceBookingPage> {
  late TextEditingController _idController;
  late TextEditingController _typeController;
  late TextEditingController _descriptionController;
   File? _image;
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage() async {
    final PickedFile? pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController();
    _typeController = TextEditingController();
    _descriptionController = TextEditingController();
    _loadUserId();
  }

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }

  late String userId;

  Future<void> _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('user_id') ?? '';
      if (userId != null) {
      _idController.text = userId;
      _typeController.text = widget.service;
    } else {
      _idController.text = '0';

    }      
    });
  }

 Future<void> _registerService() async {
    if (_image != null) {
      final uri = Uri.parse('http://10.0.2.2/Exen_Limited/Api/register_service.php');

      final imageBytes = await _image!.readAsBytes();
      final base64Image = base64Encode(imageBytes);

      final Map<String, dynamic> data = {
        'id': _idController.text,
        'type': _typeController.text,
        'description': _descriptionController.text,
        'image': base64Image,
      };
       print('Sending data: ${jsonEncode(data)}');

      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['message'] == 'New record created successfully') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Service successfully booked. Check the status to view the status and changes')),
          );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const CusHomepage();
              },
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to book the service. ${responseData['error']}')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to book the service. Please provide feedback on the issue and try again later')),
        );
      }
    } else {
      // Handle missing image
      print('Missing image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.service,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 1.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [                       
                        Expanded(
                          child: TextFormField(
                            controller: _idController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Your Id',
                            ),
                          ),
                        ),                        
                      ],
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                            controller: _typeController,
                            decoration: InputDecoration(
                              labelText: 'Service Type',
                            ),
                          ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('Attach image description'),
                    ),
                     SizedBox(
                      height: 3.0,),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'give a deeper description of the nature of what you want to be done',
                        labelText: 'Description',
                      ),
                      maxLines: 5,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    
                    Divider(
                      thickness: 4,
                    ),
                    ElevatedButton(onPressed: (){
                      _registerService();
                    }, child: Text('Complete the booking')),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}




/*class _ServicesBookingPage extends MaterialPageRoute<void> {
  final String service;
  late TextEditingController Id_controller;
  @override
  void initState() {
    super.initState();
    Id_controller = TextEditingController(text: widget.name);
  }

  @override
  void dispose() {
    Id_controller.dispose();
    super.dispose();
  }

  _ServicesBookingPage({required this.service})
      : super(builder: (BuildContext) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                '$service',
                style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black,
              elevation: 1.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                    Form(
                      
                      child: Column(
                        children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Your Id'),
                                TextFormField(
                                  controller: Id_controller,
                                  decoration: InputDecoration(
                                        labelText: 'id',
                                      ),
                                )
                              ],
                            ),
                        ],
                      ))
                  ],
              ),
            ),
          );
        });
}

*/