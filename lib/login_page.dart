// ignore: unused_import
import 'dart:convert';

import 'package:exen_app/Others/dispatch_manager.dart';
import 'package:exen_app/Others/driver.dart';
import 'package:exen_app/Others/installer.dart';
import 'package:exen_app/Others/supervisor.dart';
import 'package:exen_app/Others/supplier.dart';
import 'package:exen_app/finance_manager/home.dart';
import 'package:exen_app/interior_designer/designer_homepage.dart';
import 'package:exen_app/inventory_manager/inventory_home.dart';
import 'package:exen_app/service_manager/service_home.dart';
import 'package:exen_app/signup_page.dart';
import 'package:exen_app/superuser/superuser_homepage.dart';
import 'package:flutter/material.dart';
import 'package:exen_app/customer/cus_homepage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _passwordVisible = false;
  

final _formKey = GlobalKey<FormState>();
  late String email, password;

   Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final response = await http.post(
        Uri.parse('http://10.0.2.2/Exen_Limited/Api/Login.php'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final role = jsonData['User_Role'];   
         final userId = jsonData['User_Id'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_id', userId);
         await prefs.setString('user_Role', role);

         if (role == 'Customer') {
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const CusHomepage();
              },
            ),
          );
          
        } else if (role == 'Inventory manager') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const InventoryHome();
              },
            ),
          );
        }
        else if (role == 'Finance manager') {
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const Home();
              },
            ),
          );
        }
         else if (role == 'Dispatch manager') {
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const DispatchManager();
              },
            ),
          );
        }
         else if (role == 'Service manager') {
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const ServiceHome();
              },
            ),
          );
          
        }
         else if (role == 'Driver') {
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const Driver();
              },
            ),
          );
        }
         else if (role == 'Interior designer') {
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const Designer_Homepage();
              },
            ),
          );
        }
         else if (role == 'Installer') {
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const Installer();
              },
            ),
          );
        }
         else if (role == 'Supervisor') {
            Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const Supervisor();
              },
            ),
          );
        }
         else if (role == 'Supplier') {
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const Supplier();
              },
            ),
          );
        }
         
      } else {        
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('Error occurred, please try again')));
      }
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.grey,
          Colors.black,
          Colors.black,
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back !",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child:Form(
                    key: _formKey,
                    child:Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextFormField(
                                  
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.email),
                                      hintText: "Somebody@gmail.com",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),

                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) => email = value! ,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextFormField(                                  
                                  obscureText: _passwordVisible,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      suffixIcon: IconButton(
                                        icon: Icon(_passwordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                        validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) => password = value!,
                                ),
                              ),
                            ],
                          ),
                        ),


                        SizedBox(height: 30.0),
                        
                        SizedBox(height: 20.0),
                        ListTile(
                          title: TextButton(
                            onPressed: () {
                              _login();
                            },
                            child: Text('Login',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(height: 2.0),
                      ],
                    ),
                  ),
                    
                    )
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const SignupPage();
              },
            ),
          );
        },
        child: const Text('sign up'),
      ),
    );
  }

  }
