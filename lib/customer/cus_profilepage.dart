import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class CusProfilepage extends StatefulWidget {
  const CusProfilepage({super.key});

  @override
  State<CusProfilepage> createState() => _CusProfilepageState();
}

class _CusProfilepageState extends State<CusProfilepage> {

 Map<String, String> _cusDetails ={
   'firstname':'',
   'lastname':'',
   'location':'',
   'phonenumber':'',
   'nationalidno':'',  

 };

  String userId = '';
  //String _firstname = '';
  /*String _lastname = '';
  String _phonenumber = '';
  String _location = '';
  String _email = '';
  String _dateofbirth = '';
  String _gender = '';
  String _nationalidno = ''; 
  */ 
  bool _loading = true;
  bool _error = false;
 
 

   @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      
      userId = prefs.getString('user_id') ?? '';
      print('Loaded user id : $userId');
      if (userId.isNotEmpty) {
        _fetchUserDetails();
      } else {
        _error = true;
        _loading = false;
      }
    });
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
    final String  firstname = row['Cust_Firstname'];
      final String    lastname = row['Cust_Lastname'];
      final String    phonenumber = row['Cust_Phonenumber'];
      final String    location = row['Cust_Location'];
      final String    email = row['Email'];
      final String    dateofbirth = row['Cust_Dateofbirth'];
      final String    gender = row['Cust_Gender'];
      final String    nationalidno = row['Cust_National_Idno'];  

    setState(() {
    
      _cusDetails ={
        'firstname': firstname,
        'lastname': lastname,
        'phonenumber': phonenumber,
        'location': location,
        'email': email,
        'dateofbirth': dateofbirth,
        'gender': gender,
        'nationalidno': nationalidno,

      };
    });
  }


    @override
  Widget build(BuildContext context) {
   /* if (_loading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
     if (_error) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body:  Center(
          child: Text('Error loading details of user : $userId'),
        ),
      );
    } */

    return Scaffold(
      appBar: AppBar(
        title: Text('My profile'),
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
                            child:Text(' ${_cusDetails['firstname']}',
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
                            child:Text('${_cusDetails['lastname']}',
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
                            child:Text('${_cusDetails['nationalidno']}',
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
                            child:Text('${_cusDetails['phonenumber']}',
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
                            Text('Location :',
                            style: TextStyle(fontSize: 18,                              
                              ),
                              ),
                            Padding(padding: EdgeInsets.fromLTRB(16.0,0,16,16),
                            child:Text('${_cusDetails['location']}',
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
                            //Navigator.push(context, _UpdateProfile());
                             Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => _UpdateProfile( userDetails: _cusDetails),
                            ),
                          );                       
                        }, child: Text('Update'))

                      ],
                    ),)
                ],
              ),
            ),
          
     );
  }
}





class _UpdateProfile extends StatefulWidget{

  late final String userName;
  final Map<String, String> userDetails;

  _UpdateProfile({required this.userDetails});

 @override
 _UpdateProfileState createState() => _UpdateProfileState();
}
class _UpdateProfileState extends State<_UpdateProfile> {
   final _formKey = GlobalKey<FormState>();
  late TextEditingController _userNameController;
  late TextEditingController _lastnameController;
  late TextEditingController _phoneController;
  late TextEditingController _locationController;
  late TextEditingController _idnumberController;
  late TextEditingController _passController;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController(text: widget.userDetails['firstname']);
    _lastnameController = TextEditingController(text: widget.userDetails['lastname']);
    _phoneController = TextEditingController(text: widget.userDetails['phonenumber']);
    _locationController = TextEditingController(text: widget.userDetails['location']);
    _idnumberController = TextEditingController(text: widget.userDetails['nationalidno']);
    _passController = TextEditingController(text: widget.userDetails['']);
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
                 TextFormField(
                controller: _lastnameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
                 TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your current location';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
                 TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a the new phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
                 TextFormField(
                controller: _idnumberController,
                decoration: InputDecoration(labelText: 'National Id number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid id number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
                 TextFormField(
                controller: _passController,
                decoration: InputDecoration(labelText: 'password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Handle the form submission here
                    // e.g., send the updated user name to the server or local storage
                    print('User Name: ${_userNameController.text}');
                  }
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*TextEditingController email=TextEditingController();  
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
*/
