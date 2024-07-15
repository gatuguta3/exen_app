import 'package:flutter/material.dart';


class CusProfilepage extends StatefulWidget {
  const CusProfilepage({super.key});

  @override
  State<CusProfilepage> createState() => _CusProfilepageState();
}

class _CusProfilepageState extends State<CusProfilepage> {

  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController location=TextEditingController();
  TextEditingController phone=TextEditingController();
   TextEditingController idnumber=TextEditingController();

  String? _phoneNumber;
   DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My profile'),
      ),
      body: Column(
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
                                                                 
                                     const Text('Date fo birth'),
                                        Container(                                
                                        padding: EdgeInsets.all(10),                                                                               
                                         child:  ElevatedButton(
                                          onPressed: () => _selectDate(context ),                                         
                                          child:Icon(Icons.date_range ),                                      ),
                                          ),
        ],
      ),
    );
  }
}
