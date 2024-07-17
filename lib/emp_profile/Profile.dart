import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
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
  }
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