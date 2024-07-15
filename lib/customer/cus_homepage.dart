// ignore: unused_import
import 'dart:math';

import 'package:exen_app/customer/cus_about_us.dart';
import 'package:exen_app/customer/cus_cart.dart';
import 'package:exen_app/customer/cus_faqs.dart';
import 'package:exen_app/customer/cus_feedback.dart';
import 'package:exen_app/customer/cus_orderspage.dart';
import 'package:exen_app/customer/cus_past_services.dart';
import 'package:exen_app/customer/cus_paymentpage.dart';
import 'package:exen_app/customer/cus_servicespage.dart';
import 'package:exen_app/login_page.dart';
import 'package:flutter/material.dart';
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

Future products () async{
  var url='http://10.0.2.2/Exen_Limited/Api/Products.php';

}





  
  @override
  Widget build(BuildContext context) {
    const text = const Text(
      'Customer name',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );

    return Scaffold(
      appBar: AppBar(
        title: text,
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
                accountName: Text('Customer name'),
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
                child: const Text('Services'),
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
      
      body: SingleChildScrollView(child: Column(
        children: [
           const SizedBox(
              height: 20,
            ),
            
            Container(
              child: const Text('Services',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),

            const SizedBox(
              height: 10,
            ),
                
            Container(
              height: 300,                         
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 350,
                    height: 400,
                    child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 220.0,
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
                                    .copyWith(color: Color.fromRGBO(89, 87, 87, 1)),
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const CusServicespage();
                                },
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
                 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                    width: 350,
                    height: 400,
                    child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 210.0,
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
                             Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const CusServicespage();
                                },
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
                    height: 400,
                    child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 210.0,
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
                             Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const CusServicespage();
                                },
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

            ElevatedButton(onPressed: (){}, child: const Text('All')),
       
            
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
