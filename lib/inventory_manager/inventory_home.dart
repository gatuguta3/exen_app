import 'package:exen_app/inventory_manager/products.dart';
import 'package:exen_app/inventory_manager/suppliers.dart';
import 'package:exen_app/inventory_manager/supplies.dart';
import 'package:exen_app/login_page.dart';
import 'package:flutter/material.dart';

class InventoryHome extends StatefulWidget {
  const InventoryHome({super.key});

  @override
  State<InventoryHome> createState() => _InventoryHomeState();
}

class _InventoryHomeState extends State<InventoryHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Inventory manager name',
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
                accountName: Text('Inventory manager id '),
                accountEmail: Text('user@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/E1.png'),
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

            Divider(
              thickness: 4,
            ),

            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return  const Supplies();
                                  },
                                ),
                              );
                },
                child: const Text('Supplies'),
              ),
              leading: const Icon(Icons.inventory),
            ),

            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return  const Products();
                                  },
                                ),
                              );
                },
                child: const Text('Products'),
              ),
              leading: const Icon(Icons.inventory_2_sharp),
            ),

            ListTile(
              title: TextButton(
                onPressed: () {
                 Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return  const Suppliers();
                                  },
                                ),
                              );
                },
                child: const Text('Suppliers'),
              ),
              leading: const Icon(Icons.person),
            ),
            


            Divider(
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

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 20,),

            SizedBox(
              width: 300,
              height: 100,
              child: Card(
                child: Column(
                children: [
                  Text('Products',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    thickness: 4,
                  ),
                   Text('0',
                  style: TextStyle(fontSize: 32),
                  ),
                ],
              ),
              ),
            ),

            SizedBox(height: 40,),

            SizedBox(
              width: 300,
              height: 100,
              child: Card(
                child: Column(
                children: [
                  Text('Supplies',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    thickness: 4,
                  ),
                   Text('0',
                  style: TextStyle(fontSize: 32),
                  ),
                ],
              ),
              ),
            ),

            SizedBox(height: 40,),

            SizedBox(
              width: 300,
              height: 100,
              child: Card(
                child: Column(
                children: [
                  Text('Suppliers',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    thickness: 4,
                  ),
                   Text('0',
                  style: TextStyle(fontSize: 32),
                  ),
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


// this is the beginning of profile management
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