
import 'package:flutter/material.dart';

class ServicesList extends StatefulWidget {
  const ServicesList({super.key});

  @override
  State<ServicesList> createState() => _ServiceState();
}

class _ServiceState extends State<ServicesList> {
  @override
  Widget build(BuildContext context) {
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
                      Navigator.push(context, _ServicesBookingPage());
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
                       Navigator.push(context, _ServicesBookingPage());
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
                             Navigator.push(context, _ServicesBookingPage());
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


class _ServicesBookingPage extends MaterialPageRoute<void> {
  _ServicesBookingPage()
      : super(builder: (BuildContext context) {
          return Scaffold(
             appBar: AppBar(
              title: Text('Services Booking'),
            ),
          );
        });
}