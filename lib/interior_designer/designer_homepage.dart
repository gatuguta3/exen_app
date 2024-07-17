import 'dart:convert';

import 'package:exen_app/interior_designer/consultations.dart';
import 'package:exen_app/interior_designer/projects.dart';
import 'package:exen_app/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Designer_Homepage extends StatefulWidget {
  const Designer_Homepage({super.key});
  

  @override
  State<Designer_Homepage> createState() => _HomepageState();
}
Future<void> insertuser() async
 {
  
  if(email !="" || password !="" || location !=""  || phone !=""  || idnumber.text !=""  || firstname.text !=""  || lastname.text !=""){
    
        //String rawInput = email.text;
       // String sanitizedInput = rawInput.replaceAll(RegExp(r'<[^>]*>'), '');
      String url= "http://10.0.2.2/Exen_Limited/Api/demo.php";
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
  

class _HomepageState extends State<Designer_Homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Designer name',
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
                 Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return  const Projects();
                                  },
                                ),
                              );
                },
                child: const Text('projects'),
              ),
              leading: const Icon(Icons.construction),
            ),
              ListTile(
              title: TextButton(
                onPressed: () {
                 Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return  const Consultations();
                                  },
                                ),
                              );
                },
                child: const Text('Work history'),
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

      body: SingleChildScrollView(
        child: Center(
          child: Column(
          children: [
               const  Text('Assigned Consultations',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                ),

               const  SizedBox(
                  height: 20,
                ),

               SizedBox(
                width: 350,
                height: 210,
                child: Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                     const SizedBox(height: 5,),
                      Row(
                        children: [
                          Text('Customer Id :  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                          Text('null'),
                        ],
                      ),
                    const   SizedBox(height: 10,),
                        Row(
                          children: [
                             Text('Description   :   ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                             Column(
                            children: [                               
                            Text('null'),
                            ],
                           )
                          ],
                        ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                           Text('Date of execution  :  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                            Text('null'),
                        ],
                      ),
                      const SizedBox(height: 10,),
                     const  Divider(thickness: 2,),
                      const SizedBox(height: 2,),
                     ElevatedButton(onPressed: (){}, child: Text('Accept')),
                    ],
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

            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/student1.jpeg'),
                            radius: 70,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Firstname : ',
                            style: TextStyle(fontSize: 18,                              
                              ),
                              ),
                            Padding(padding: EdgeInsets.fromLTRB(16.0,0,16,16),
                            child:Text('First name',
                              style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold
                              ),
                              ) ,
                              )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lastname : ',
                            style: TextStyle(fontSize: 18,                              
                              ),
                              ),
                            Padding(padding: EdgeInsets.fromLTRB(16.0,0,16,16),
                            child:Text('Lastname',
                              style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold
                              ),
                              ) ,
                              )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('National Id No :',
                            style: TextStyle(fontSize: 18,                              
                              ),
                              ),
                            Padding(padding: EdgeInsets.fromLTRB(16.0,0,16,16),
                            child:Text('get from database',
                              style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold
                              ),
                              ) ,
                              )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone number :',
                            style: TextStyle(fontSize: 18,                              
                              ),
                              ),
                            Padding(padding: EdgeInsets.fromLTRB(16.0,0,16,16),
                            child:Text('get from database',
                              style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold
                              ),
                              ) ,
                              )
                          ],
                        ),
                        Divider(
                          thickness: 4,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: (){   
                            Navigator.push(context, _UpdateProfile());                       
                        }, child: Text('Update'))

                      ],
                    ),)
                ],
              ),
            ),
          );
        });
        
          
}



TextEditingController email=TextEditingController();  
  TextEditingController password=TextEditingController();
  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController location=TextEditingController();
  TextEditingController phone=TextEditingController();
   TextEditingController idnumber=TextEditingController();

   

class _UpdateProfile extends MaterialPageRoute<void> {

  

  
  _UpdateProfile()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Update your profile',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black,
              elevation: 1.0,
            ),

            body: SingleChildScrollView(
                  child:  Center(
                    child: Column(
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
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.lock),
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),

                              ElevatedButton(
                          onPressed: (){  
                                    insertuser();            
                        },
                         child: Text('Update'),
                        ),
                    ],
                  ),
                  ),
            ),
          );
        });
}