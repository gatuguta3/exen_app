import 'package:exen_app/Others/driver.dart';
import 'package:exen_app/Others/supervisor.dart';
import 'package:exen_app/customer/cus_homepage.dart';
import 'package:exen_app/interior_designer/designer_homepage.dart';
import 'package:exen_app/inventory_manager/inventory_home.dart';
import 'package:flutter/material.dart';

class SuperuserHomepage extends StatefulWidget {
  const SuperuserHomepage({super.key});

  @override
  State<SuperuserHomepage> createState() => _SuperuserHomepageState();
}

class _SuperuserHomepageState extends State<SuperuserHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: const Text(
                'Superuser',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black,
              elevation: 1.0,
              automaticallyImplyLeading: false,
            ),

            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(                      
                          onPressed: (){   
                               Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const CusHomepage();
                                  },
                                ),
                              );   
                        }, child: Text('Customer',
                        style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                        ),
                        ),

                        ElevatedButton(                      
                          onPressed: (){  
                             Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const InventoryHome();
                                  },
                                ),
                              ); 
                                 
                        }, child: Text('Inventory manager',
                        style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                        ),
                        ),
                        ElevatedButton(                      
                          onPressed: (){   
                                 Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const Driver();
                                  },
                                ),
                              );     
                        }, child: Text('Driver',
                        style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                        ),
                        ),

                        ElevatedButton(                      
                          onPressed: (){   
                               Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const  Designer_Homepage();
                                  },
                                ),
                              );        
                        }, child: Text('Interior designer',
                        style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                        ),
                        ),

                        ElevatedButton(                      
                          onPressed: (){   
                                              
                        }, child: Text('Service manager',
                        style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                        ),
                        ),

                        ElevatedButton(                      
                          onPressed: (){   
                                              
                        }, child: Text('Installer',
                        style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                        ),
                        ),

                        ElevatedButton(                      
                          onPressed: (){   
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const  Supervisor();
                                  },
                                ),
                              );     
                                              
                        }, child: Text('Supervisor',
                        style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                        ),
                        ),

                        ElevatedButton(                      
                          onPressed: (){   
                                              
                        }, child: Text('supplier',
                        style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                        ),
                        ),

                        ElevatedButton(                      
                          onPressed: (){   
                                              
                        }, child: Text('Finance manager',
                        style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                        ),
                        ),

                        ElevatedButton(                      
                          onPressed: (){   
                                              
                        }, child: Text('Dispatch manager',
                        style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                        ),
                        ),

                  ],

                ),
              ),
            ),
    );
  }
}