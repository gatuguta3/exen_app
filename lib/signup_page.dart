import 'dart:convert';

import 'package:exen_app/Others/driver.dart';
import 'package:exen_app/interior_designer/designer_homepage.dart';
import 'package:exen_app/inventory_manager/inventory_home.dart';
import 'package:exen_app/login_page.dart';
import 'package:exen_app/superuser/superuser_homepage.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'customer/cus_homepage.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _passwordVisible = false;  

  TextEditingController email=TextEditingController();  
  TextEditingController password=TextEditingController();
  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController location=TextEditingController();
  TextEditingController phone=TextEditingController();
   TextEditingController idnumber=TextEditingController();

 /* var uuid = Uuid();
   Uuid get Id => uuid;
  

  String? _phoneNumber;
   DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate)
    setState(() {
    _selectedDate = picked;
   });
  }
  */
  String role="Customer";
  String default_status="Approved";
  
  

 Future<void> insertuser() async
 {
  
  if(email !="" || password !="" || location !=""  || phone !=""  || idnumber.text !=""  || firstname.text !=""  || lastname.text !=""){
    
        //String rawInput = email.text;
       // String sanitizedInput = rawInput.replaceAll(RegExp(r'<[^>]*>'), '');
      String url= "http://10.0.2.2/Exen_Limited/Api/signup.php";
      var response= await http.post(Uri.parse(url),body: {
        "email":email.text,
        "password":password.text,
        "location":location.text,       
        "phone":phone.text,
        "idnumber":idnumber.text,
        "firstname":firstname.text,
        "lastname":lastname.text,

     }); 
    var respond =jsonDecode(response.body);
    if(respond["success"]=="true"){
      print("Success");
    }
    else{
      print("failed");
    }
  }
  else{
    print("please input all details");
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
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Dear Customer Please input your details to create an account !",
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
                  child: Padding(
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
                          child:SingleChildScrollView(
                            child:  Column(
                            children: [

                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: email,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.email),
                                      hintText: "Somebody@gmail.com",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),  

                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: firstname,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.person_2),
                                      hintText: "Firstname",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                               Container(
                                
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: lastname,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.person_2),
                                      hintText: "Lastname",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                               TextFormField(
                                controller: phone,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  filled: true,
                                  icon: Icon(Icons.phone),
                                  hintText: 'Where can we reach you?',
                                  labelText: 'Phone Number *',                                 
                                ),
                                keyboardType: TextInputType.phone,
                                ),
                                Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: location,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.location_pin),
                                      hintText: "Location",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: idnumber,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.perm_identity),
                                      hintText: "National Id Number",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                                                                 
                                                                
                               
                               
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: password,
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
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  
                                  obscureText: _passwordVisible,
                                  decoration: InputDecoration(
                                      hintText: " Confirm Password",
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
                                ),
                              ),
                            ],
                          ),
                     ) ),
                        SizedBox(height: 20.0),
                        ListTile(
                          title: TextButton(
                            onPressed: () {
                              insertuser();                              
                            },
                            child: Text('Sign up',
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
                return const SuperuserHomepage();
              },
            ),
          );
        },
        child: const Text('sign in'),
      ),
    );
  }
}
