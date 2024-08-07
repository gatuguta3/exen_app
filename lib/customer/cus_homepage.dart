// ignore: unused_import
import 'dart:developer';
import 'dart:math';

import 'package:exen_app/customer/cus_about_us.dart';
import 'package:exen_app/customer/cus_cart.dart';
import 'package:exen_app/customer/cus_faqs.dart';
import 'package:exen_app/customer/cus_feedback.dart';
import 'package:exen_app/customer/cus_orderspage.dart';
import 'package:exen_app/customer/cus_past_services.dart';
import 'package:exen_app/customer/cus_paymentpage.dart';
import 'package:exen_app/customer/services_list.dart';
import 'package:exen_app/emp_profile/Profile.dart';
import 'package:exen_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cus_profilepage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CusHomepage extends StatefulWidget {
  const CusHomepage({super.key});

  @override
  State<CusHomepage> createState() => _CusHomepageState();
}

class _CusHomepageState extends State<CusHomepage> {

  int _selectedIndex = 0;
  final List<String> _options = [
    'All',
    'Oven',
    'Hoods',
    'Microwave',
    'Burner tops',
    'Dishwashers',
    'Fridges'
  ];


   String _userNameText = 'Loading...';
   late String userId;
  bool _loading = true;
  bool _error = false;
  String _firstname = '';
  String _lastname = '';
  String _phonenumber = '';
  String _location = '';
  String _emailtext = 'loading...';
  String _dateofbirth = '';
  String _gender = '';
  String _nationalidno = '';  
   @override
  void initState() {
    super.initState();
    _loadUserId();
     _fetchUserDetails();
         
  }
  

  Future<void> _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('user_id') ?? '';
      if (userId.isNotEmpty) {
        _fetchUserDetails();
      } else {
        _error = true;
        _loading = false;
      }
    });
  }

  Future<void> _logout(BuildContext context) async {
    // Clear user ID from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');

    // Navigate back to login page
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginPage(),
      ),
    );
  }

  Future<void> _checkAuthentication(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');

    if (userId == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const LoginPage(),
        ),
      );
    }
  }

   Future<void> _fetchUserDetails() async {
   
      final response = await http.post(
        Uri.parse('http://10.0.2.2/Exen_Limited/Api/get_cus_details.php'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'user_id': userId},
      );

     if (response.statusCode == 200) {
    _handleResponse(response.body);
    print('Response data: ${response.body}');
    
  } else {
   
    print('Failed to load data');
  }
  }

void _handleResponse(String responseBody) {
    final Map<String, dynamic> row = jsonDecode(responseBody);
    final String userName = row['Cust_Firstname'] ?? 'Unknown';
    final String email = row['Email'] ?? 'Unknown' ;

    setState(() {
      _userNameText = userName;
      _emailtext = email;
      
    });
  }

List products = [];
Future<void> allproducts() async{
  try{
    String uri="http://10.0.2.2/Exen_Limited/Api/Products_cus.php";
    var response=await http.get(Uri.parse(uri));
  setState(() {
    products=jsonDecode(response.body);
  });    

  }catch(e){
    print(e);
  }
}

  
  @override
  Widget build(BuildContext context) {
    
    _checkAuthentication(context);

    
    return Scaffold(
      appBar: AppBar(
        title: Text(
      //'User ID: $userId',
      'Welcome back $_userNameText',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
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
                accountName: Text('$userId '),
                accountEmail: Text('$_userNameText'),
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
                        return const CusProfilepage();
                      },
                    ),
                  );
                },
                child: const Text('Profile'),
              ),
              leading: const Icon(Icons.person),
            ),
            const Divider(
              thickness: 4,
            ),
                ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return  const ServicesList();
                      },
                    ),
                  );
                },
                child: const Text('Book a service'),
              ),
              leading: const Icon(Icons.money_outlined),
            ),

            const Divider(
              thickness: 4,
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const CusPaymentpage();
                      },
                    ),
                  );
                },
                child: const Text('Payments'),
              ),
              leading: const Icon(Icons.money_outlined),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const CusPastServices();
                      },
                    ),
                  );
                },
                child: const Text('Service history'),
              ),
              leading: const Icon(Icons.front_hand_outlined),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const CusOrderspage();
                      },
                    ),
                  );
                },
                child: const Text('Orders'),
              ),
              leading: const Icon(Icons.inventory),
            ),
            const Divider(
              thickness: 4,
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const CusFeedback();
                      },
                    ),
                  );
                },
                child: const Text('Feedback'),
              ),
              leading: const Icon(Icons.feedback),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const CusAboutUs();
                      },
                    ),
                  );
                },
                child: const Text('About us'),
              ),
              leading: const Icon(Icons.info),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const CusFaqs();
                      },
                    ),
                  );
                },
                child: const Text('FAQs'),
              ),
              leading: const Icon(Icons.question_mark),
            ),
            const Divider(
              thickness: 4,
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
                          onPressed: () => _logout(context),
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
      
      body: SingleChildScrollView(
        child: Column(
        children: [
          Column(
            children: [
               const SizedBox(
              height: 20,
            ),
            
             Container(
              child: const Text('Products',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),         

            Card(
               margin: EdgeInsets.all(20),
               child:  TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled:true,
                icon: Icon(Icons.search) ,
                labelText: 'search product by name',
              ),
            ),
            ),  
             const SizedBox(
              height: 4,
            ),

             SizedBox(
                width: 350,
                height: 210,
                child: Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                     const SizedBox(height: 5,),
                      Positioned.fill(
                            child: Image.network('https://rileyjames.co.uk/product/cda-sl400ss-single-oven/'),
                           
                          ),         

                      SizedBox(height: 10,),                    
                      
                     const  Divider(thickness: 2,),
                     const SizedBox(height: 10,),
                      Row(
                        children: [
                           Text('Name  :  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                            Text('In built oven'),
                        ],
                      ),
                       Row(
                        children: [
                           Text('Price  :  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                            Text('10000'),
                        ],
                      ),
                      const SizedBox(height: 2,),
                     ElevatedButton(onPressed: (){}, child: Text('View')),
                    ],
                  ),
                ),
               ),
         
            ],
          ),
         
       
            
        ],
      ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const CusCart();
              },
            ),
          );
        },
        child: const Icon(Icons.shopping_cart_checkout_rounded),
      ),
      
    );
  }

  querySelector(String s) {}
}
